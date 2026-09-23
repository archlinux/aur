prepare:
	makepkg --nobuild --clean --cleanbuild --verifysource

build: prepare
	makepkg --printsrcinfo > .SRCINFO
	makepkg --rmdeps --syncdeps --force
