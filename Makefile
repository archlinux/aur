package:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -vr pkg
	@rm -vr src
	@rm -vr bash_unit-*.pkg.tar.zst v*.tar.gz
