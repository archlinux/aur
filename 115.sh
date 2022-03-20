#!/bin/sh
export LD_LIBRARY_PATH=/opt/115pc/lib:$LD_LIBRARY_PATH
export PATH=/opt/115pc:$PATH
/bin/bash -c "exec -a $0 115 > /dev/null 2>&1" $0 
