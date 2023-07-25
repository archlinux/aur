all: makepkg

makepkg: clean
	makepkg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	$(RM) kx3util*.pkg.tar.zst
	$(RM) KX3Utility*.tar.gz
	$(RM) -r pkg
	$(RM) -r src
