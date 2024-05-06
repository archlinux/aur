.DEFAULT_GOAL := .SRCINFO
.PHONY: all install check clean

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

all: build install

build: PKGBUILD .SRCINFO .install
	makepkg -f
	touch build

install: build
	makepkg -i

check: build
	namcap *.pkg.tar.*

clean:
	rm -rf build pkg src *.tar.* *.part
