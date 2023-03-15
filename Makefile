.PHONY: all build

all: build SRCINFO

build:
	makepkg

SRCINFO: PKGBUILD
	-namcap questdb-git-*.tar.zst
	makepkg --printsrcinfo > .SRCINFO
