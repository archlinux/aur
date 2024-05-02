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

.PHONY: update-sha
update-sha:
	@./update-sha.sh
	$(MAKE) gen
