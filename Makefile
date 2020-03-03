.PHONY: all build check

all: build check

build:
	makepkg --printsrcinfo > .SRCINFO

check:
	namcap PKGBUILD
