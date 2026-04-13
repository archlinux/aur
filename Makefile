PLUGINS := container json k8saudit

.PHONY: default clean

default: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@

PKGBUILD: PKGBUILD.in
	m4 -D_PLUGINS_="$(PLUGINS)" $< > $@
	updpkgsums $@

clean:
	rm -f PKGBUILD .SRCINFO
	rm -rf pkg src
