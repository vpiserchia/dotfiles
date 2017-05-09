# . bashrc
#

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

function source_folder () {
  local folder=$1
  if [ -d $folder ]; then
    for filename in $(find $folder -maxdepth 1 -type f | sort); do
      . $(readlink -f $filename)
    done
  fi
}

source_folder $HOME/.bashrc.d

# 256-color mode not supported on this host
#if echo $TERM | grep -q -- '-256color'; then
#    echo -e '\n\n256-color mode not supported on this host.  Reverting TERM...\n'
#    export TERM=`echo -n $TERM | sed 's/-256color//'`
#fi

# the last one!
export PATH

