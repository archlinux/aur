#!/bin/sh
#
# 90alsa: suspend/wakeup ALSA devices

case "$1" in
hibernate|suspend)
;;
thaw|resume)
aplay -d 1 /dev/zero
;;
*) exit $NA
;;
esac
