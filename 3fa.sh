#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/3fa/3fa.asar "$@"
else
    exec electron --no-sandbox /opt/3fa/3fa.asar "$@"
fi