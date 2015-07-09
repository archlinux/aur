#!/bin/sh
cd /usr/share/OculusTuscanyDemo/
if [ $1 = "--debug" ]; then
        if [ ! -z "$DEBUGGER" ]; then
                echo "\$DEBUGGER Set to $DEBUGGER"
                $DEBUGGER ./OculusWorldDemo64Debug "$@"
        else
                echo "\$DEBUGGER not set, using gdb"
                gdb --args ./OculusWorldDemo64Debug "$@"
        fi
else
        echo "Starting Release Version"
        ./OculusWorldDemo64
fi
