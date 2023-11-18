SHELL := /bin/bash

clean:
	rm -f *.gz *.xz *.zst 
	rm -rf pkg/*
	rm -rf src/*

prepare:
	updpkgsums
	makepkg --printsrcinfo | tee .SRCINFO

build: prepare
	makepkg -C -f

.PHONY: clean prepare build
