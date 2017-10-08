all: makepkg srcinfo

makepkg: mikelpint-keyring.install PKGBUILD
	 makepkg --sign

srcinfo: mikelpint-keyring.install PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src *pkg.tar.xz *pkg.tar.xz.sig
