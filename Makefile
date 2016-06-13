all:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -f

clean:
	rm -rf guayadeque/ pkg/ src/ guayadeque-git-*.pkg.tar.xz

