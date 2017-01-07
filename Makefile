all:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -f

clean:
	rm -rf guayadeque/ pkg/ src/

cleanall: clean
	rm -rf guayadeque-git-*.pkg.tar.xz

