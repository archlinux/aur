build:
	makepkg -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src tuvpn-gui *.pkg.tar.*
