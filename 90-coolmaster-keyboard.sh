#!/bin/bash
#
# This script sets default settings on Xorg start for a coolmaster dominator
# keyboard. 0 is a good exit status. Anything else is a count of the errors.
#

#source the config
CONFIG="/etc/default/coolmaster_keyboard"
source "$CONFIG"

#issue warnings to stderr, also increment the error count.
warn(){
    echo "coolmaster-keyboard: WARN: $@" 1>&2
    EXIT+=1
}

#LED backlight setting, santize inputs first.
BACKLIGHT=${BACKLIGHT,,}
case $BACKLIGHT in
  on|off)
    xset led $BACKLIGHT
    ;;
  *)
    warn "invalid backlight setting in $CONFIG"
    ;;
esac

