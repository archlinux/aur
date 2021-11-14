.PHONY: all check release

all:
	makepkg -f

release:
	namcap PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
