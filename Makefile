SHELL := /bin/bash

clean:
	rm kmonad *.gz *.xz *.zst

prepare:
	updpkgsums
	makepkg --printsrcinfo | tee .SRCINFO

build: prepare
	makepkg -C -f

.PHONY: clean prepare build
