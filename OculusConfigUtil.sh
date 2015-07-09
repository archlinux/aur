#!/bin/sh
export LC_ALL=C # bug with profile saving when using locale with . as decimal separator: https://developer.oculusvr.com/forums/viewtopic.php?f=34&t=16130&p=211228&hilit=linux#p211228
cd /usr/share/OculusConfigUtil/
./RiftConfigUtil "$@"
