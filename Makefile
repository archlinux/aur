.PHONY: all build check

all: check release

check:
	namcap PKGBUILD

release:
	makepkg --printsrcinfo > .SRCINFO
