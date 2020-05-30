.PHONY: all check release

all:
	makepkg -sd

check:
	namcap PKGBUILD

release:
	makepkg --printsrcinfo > .SRCINFO
