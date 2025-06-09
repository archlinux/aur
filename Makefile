.PHONY: build
build:
	go generate ./...
	makepkg -g >>PKGBUILD
	makepkg --printsrcinfo >.SRCINFO
