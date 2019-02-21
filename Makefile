.DEFAULT_GOAL := .SRCINFO
.PHONY: all build install clean

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

all: build install

build: PKGBUILD .SRCINFO
	makepkg -f

install: PKGBUILD build
	makepkg -i

clean:
	rm -rf pkg src *.tar.gz *.tar.xz *.part
