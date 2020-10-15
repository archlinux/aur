update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD

clean:
	rm -f *.pacman
	rm -f *.tar.*
	rm -rf pkg src
