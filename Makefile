nam = $(shell sed -n 's/^_pkgname=//p' PKGBUILD)
src = PKGBUILD
inf = .SRCINFO

all: sum $(inf) check

$(inf): $(src)
	makepkg --printsrcinfo >$@

check: $(src)
	namcap $^

sum: $(src)
	updpkgsums

clean:
	rm -rf $(inf) $(nam)* *.tar.xz *.tar.gz *.tar *.tgz pkg/ src/ *.part

package:
	makepkg -C

# vim: se ts=4:
