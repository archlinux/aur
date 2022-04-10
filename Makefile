build:
	makepkg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf OliveTin-*
	rm -rf olivetin-*
	rm -rf src pkg
