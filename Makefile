build: clean
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf *.tar.* *.pkg.* src pkg
