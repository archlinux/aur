PREFIX = /usr
DESTDIR =

HOOK_SRC = 99-check-reproducible-status.hook
SCRIPT_SRC = check-reproducible-status

INSTALL = install
MAKEPKG = makepkg
SHA256SUM = sha256sum

.PHONY: install
install:
	$(INSTALL) -Dm644 -t $(DESTDIR)/$(PREFIX)/share/libalpm/hooks $(HOOK_SRC)
	$(INSTALL) -Dm755 -t $(DESTDIR)/$(PREFIX)/share/libalpm/scripts $(SCRIPT_SRC)

.SRCINFO: PKGBUILD
	$(MAKEPKG) --printsrcinfo > .SRCINFO

.PHONY: verify
verify:
	$(MAKEPKG) --verifysource

.PHONY: check
check: .SRCINFO verify
