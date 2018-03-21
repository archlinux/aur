all: makepkg

makepkg: clean
	makepkg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	$(RM) kx3util*.pkg.tar.xz
	$(RM) KX3Utility*.tgz
	$(RM) -r pkg
	$(RM) -r src
