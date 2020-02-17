all: .SRCINFO package

clean:
	rm -rf pkg src

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package:
	makepkg -s
