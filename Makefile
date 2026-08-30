.PHONY: all
all: update-checksums printsrcinfo install

.PHONY: update-checksums
update-checksums:
	@makepkg -g > /tmp/new_checksums.txt
	@LINE=$$(grep -n '^sha256sums=' PKGBUILD | cut -d: -f1); \
	 sed -i "$${LINE}c$$(cat /tmp/new_checksums.txt)" PKGBUILD
	@rm /tmp/new_checksums.txt

.PHONY: printsrcinfo
printsrcinfo:
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: install
install:
	@makepkg -sfi

.PHONY: clean
clean:
	@rm -rf src/ pkg/ *.pkg.tar.* *.deb
