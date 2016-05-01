.PHONY : package clean default

default : .SRCINFO

.SRCINFO : package
	mksrcinfo

package : PKGBUILD
	makepkg

clean :
	-rm -rf src pkg fernflower *.pkg.tar*
