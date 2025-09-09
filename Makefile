all: .SRCINFO

.SRCINFO: base.SRCINFO
	./gensrcinfo $^ > $@

base.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@
