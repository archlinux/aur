.DEFAULT_GOAL := .SRCINFO
.PHONY: all install check clean

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

all: build install

build: PKGBUILD .SRCINFO
	makepkg -f
	touch build

install: build
	makepkg -i

check: build
	namcap *.tar.xz

clean:
	rm -rf build pkg src *.tar.* *.part
