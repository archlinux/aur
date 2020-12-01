.PHONY: all check gensign release

all:
	makepkg -f

check:
	namcap PKGBUILD
	namcap *.zst

geninteg:
	makepkg --geninteg

release:
	makepkg --printsrcinfo > .SRCINFO
	git add PKGBUILD .SRCINFO
