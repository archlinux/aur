all: .SRCINFO package

clean:
	rm -rf pkg src *.gem *.pkg.*

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package:
	makepkg -s
