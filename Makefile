all: .SRCINFO package

clean:
	rm -rf pkg src *.gem *.pkg.* *.gz

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package:
	makepkg -s
