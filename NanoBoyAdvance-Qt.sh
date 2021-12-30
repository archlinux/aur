#!/bin/sh

confdir=.

if [[ ! -z "$XDG_CONFIG_HOME" ]]; then
	confdir="${XDG_CONFIG_HOME}/NanoBoyAdvance-Qt"
elif [[ ! -z "$HOME" ]]; then
	confdir="${HOME}/.config/NanoBoyAdvance-Qt"
fi

mkdir -p "$confdir"
cd "$confdir"

exec -a "$confdir/NanoBoyAdvance-Qt" /usr/lib/NanoBoyAdvance-Qt "$@"
