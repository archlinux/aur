package:
	makepkg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src *.pkg.tar.xz
