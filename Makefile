build: clean
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf dtvp_* *.pkg.* src pkg
