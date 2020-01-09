.PHONY: all
all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -f contentful-cli-*.tar.xz
	rm -f contentful-cli-*.tgz
	rm -rf src pkg
