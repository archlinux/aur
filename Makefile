SHELL       := /bin/bash
PKGBUILD    := PKGBUILD
SRCINFO     := .SRCINFO
TRACKED     := PKGBUILD .SRCINFO xddns.service xddns.sysusers xddns.install xddns.example.yaml

bump:
	@echo ">> bumping pkgver -> $(VERSION), resetting pkgrel=1"
	sed -i 's/^pkgver=.*/pkgver=$(VERSION)/' $(PKGBUILD)
	sed -i 's/^pkgrel=.*/pkgrel=1/' $(PKGBUILD)
	$(MAKE) updpkgsums

pkgrel: 
	@echo ">> bumping pkgrel"
	cur=$$(grep -oP '^pkgrel=\K[0-9]+' $(PKGBUILD)); \
	next=$$((cur + 1)); \
	sed -i "s/^pkgrel=.*/pkgrel=$$next/" $(PKGBUILD); \
	echo "pkgrel: $$cur -> $$next"

tar:
	@pkgver=$$(grep -oP '^pkgver=\K.+' $(PKGBUILD)); \
	pkgname=$$(grep -oP '^pkgname=\K.+' $(PKGBUILD)); \
	root=$$(git rev-parse --show-toplevel); \
	echo ">> creating local source tarball $${pkgname}-$${pkgver}.tar.gz from repository root ($$root)"; \
	git -C "$$root" ls-files --cached --others --exclude-standard --exclude="pkg" --exclude="src" -z | \
	sort -u -z | \
	tar -czf "$${pkgname}-$${pkgver}.tar.gz" -C "$$root" --transform "s|^|$${pkgname}-$${pkgver}/|" --null -T -

updpkgsums:
	updpkgsums

build:
	makepkg -o
	makepkg -si --noconfirm

refresh: clean-light updpkgsums build namcap smoketest srcinfo

refresh-local: clean-light tar updpkgsums build namcap smoketest srcinfo

namcap:
	@echo ">> running namcap"
	namcap $(PKGBUILD)
	namcap xddns-*.pkg.tar.zst

smoketest:
	@echo ">> smoke testing installed package"
	sudo systemctl cat xddns.service
	xddns version
	sudo xddns config validate || [ $$? -eq 1 ]

srcinfo:
	makepkg --printsrcinfo > $(SRCINFO)

clean-light:
	@echo ">> removing build artifacts"
	sudo rm -rf *.pkg.tar.zst *.pkg.tar.xz *.log

clean:
	@echo ">> removing build artifacts and old files"
	sudo rm -rf pkg/ src/ *.pkg.tar.zst *.pkg.tar.xz *.log

distclean: clean
	@echo ">> removing downloaded sources"
	sudo rm -rf *.tar.gz *.tar.xz *.tar.bz2 *~ *.orig
