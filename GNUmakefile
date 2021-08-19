.PHONY: all

all:
	mkdir -p src
	cd src && updpkgsums ../PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
	makepkg
