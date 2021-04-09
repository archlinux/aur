#!/bin/sh

confdir=.

if [[ ! -z "$XDG_CONFIG_HOME" ]]; then
	confdir="${XDG_CONFIG_HOME}/NanoBoyAdvance"
elif [[ ! -z "$HOME" ]]; then
	confdir="${HOME}/.config/NanoBoyAdvance"
fi

mkdir -p "$confdir"
cd "$confdir"

[[ ! -f config.toml ]] && cp /usr/share/NanoBoyAdvance/config.toml .
[[ ! -f keymap.toml ]] && cp /usr/share/NanoBoyAdvance/keymap.toml .

exec /usr/lib/ld-linux-x86-64.so.2 --argv0 "$confdir/NanoBoyAdvance" /usr/lib/NanoBoyAdvance "$@"
