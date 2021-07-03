# Makefile
#
# Meant to help with maintaining.

all: .SRCINFO

release: all build check
	@echo
	@echo 'ready to release!'

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@

build:
	makepkg -s

clean:
	git clean -dfx

check:
	namcap PKGBUILD
	namcap *.tar.zst

.PHONY: build clean check release
