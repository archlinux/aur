all: .SRCINFO package

clean:
	rm -rf pkg src *.gem *.pkg.* *.tar.gz*

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package:
	makepkg -s
