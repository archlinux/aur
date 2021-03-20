.PHONY: auto-update clean post test-upgrade upgrade versions

LATEST_VER := $(shell curl -s https://github.com/japgolly/tla2json/releases/latest | perl -pe 's!.*/tag/v(.+?)".*!$$1!')

versions:
	@echo "Current version:"
	@grep '^pkgver' PKGBUILD | sed 's/.*=/  /'
	@echo "Latest version:"
	@echo "  $(LATEST_VER)"

test-upgrade:
	perl -pi -e 's/^pkgver=.+/pkgver=$(LATEST_VER)/' PKGBUILD
	bash -c 'sed -i -e "/^sha256sums.*/,+1c $$(makepkg -g | perl -0777 -pe "chop; s/\n/\\\n/g")" PKGBUILD'

upgrade:
	@make test-upgrade
	@make post
	git add .SRCINFO PKGBUILD
	git commit -m "Upgrade to $(LATEST_VER)" .SRCINFO PKGBUILD

post:
	makepkg --verifysource -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf /tmp/makepkg/tla2json
	git clean -fX
