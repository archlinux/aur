PY = rofi-twitch
ICON = $(PY).png
DESKTOP = $(PY).desktop

pkg: .SRCINFO
	makepkg --check --noconfirm -sf

.SRCINFO: PKGBUILD
	makepkg --check --printsrcinfo > $@

PKGBUILD: format pngopt $(DESKTOP)
	updpkgsums

format: $(PY)
	yapf -i $<

pngopt: $(ICON)
	optipng $<

.PHONY: format pngopt
.PRECIOUS: $(PY) $(ICON) $(DESKTOP) PKGBUILD
