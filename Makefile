package:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -vr pkg src bash_unit-*.pkg.tar.zst v*.tar.gz
