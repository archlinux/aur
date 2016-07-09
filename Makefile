versionbump:
	makepkg --printsrcinfo > .SRCINFO
	git add .SRCINFO
	git commit -m "Version Bump "$(shell grep pkgver .SRCINFO | cut -d\= -f 2| tr -d '[[:space:]]' )
