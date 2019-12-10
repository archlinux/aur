package:
	makepkg

srcinfo: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src *.pkg.tar.xz
