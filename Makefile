# vim: ft=make ts=4 sw=4 noet

define usage

Available 'make' targets are:

help  Display this text.
shc   Shell script care.

endef

mp		?= makepkg --geninteg

.PHONY:	gi help shc

help:
	$(info $(usage))
	@exit 0

shc:
	shcare *.sh

gi:
	sed -i.bak -E "s/^sha256sums=.+/$(shell $(mp) --geninteg)/" PKGBUILD
