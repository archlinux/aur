build:
	makepkg -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src lightdm-elephant-greeter *.pkg.tar.xz

