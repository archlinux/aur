all:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -fs

clean:
	rm -rf guayadeque/ pkg/ src/

cleanall: clean
	rm -rf guayadeque-git-*.pkg.tar.xz

