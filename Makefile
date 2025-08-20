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

compare-versions:
	cat PKGBUILD | sed -r -n -e 's/^\s*pkgver\s*=\s*([0-9\.]+)\s*$$/\1/p'
	curl -s https://desktop.download.sipgate.com/latest.yml | yq '.version'
	curl -s https://desktop.download.sipgate.com/latest-linux.yml | yq '.version'
	curl -s https://desktop.download.sipgate.com/latest-mac.yml | yq '.version'

clean:
	rm -rf src pkg sipgate-app-clinq*.tar.zst

dist-clean: clean
	rm -f sipgate*CLINQ*.deb

sha512-base64-sums:
	@curl -s https://desktop.download.sipgate.com/latest-linux.yml
	@echo
	@for F in sipgate-*-amd64.deb; do \
		sha512sum $$F | cut -d' ' -f1 | xxd -p -r | base64 -w0; \
		echo "  $$F"; \
	done

b2-sums:
	@b2sum sipgate-*-amd64.deb

.PHONY: package sanity-check compare-versions clean dist-clean sha512-base64-sums b2-sums

