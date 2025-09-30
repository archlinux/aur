SHELL := bash

.PHONY: clean
clean:
	@rm -rfv duo-desktop-*

.PHONY: install
install: clean
	@makepkg -cisr

.PHONY: gen
gen: .SRCINFO

.SRCINFO: PKGBUILD duo.install
	@makepkg --printsrcinfo >$@

.PHONY: update-pkgbuild
update-pkgbuild:
	@./update-PKGBUILD.sh
	$(MAKE) gen
