# TODO: build target that
#  - checks for latest version
#  - puts that version number into PKGBUILD
#  - downloads corresponding archive
#  - calculates b2sum
#  - puts that b2sum into PKGBUILD
#  - generates SRCINFO
#  - builds package

package:
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo >$@

sanity-check:
	namcap PKGBUILD
	namcap sipgate-app-clinq-*.pkg.tar.zst

clean:
	rm -rf src pkg sipgate-app-clinq*.tar.zst

dist-clean: clean
	rm -f sipgate*CLINQ*.deb

.PHONY: package sanity-check clean dist-clean

