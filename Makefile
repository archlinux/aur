all: .SRCINFO PKGBUILD
	makepkg

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src *.tar.gz *.tar.xz *.patch
