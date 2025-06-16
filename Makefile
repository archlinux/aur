.PHONY: build
build:
	cp PKGBUILD.in PKGBUILD
	makepkg -g >>PKGBUILD
	makepkg --printsrcinfo >.SRCINFO
