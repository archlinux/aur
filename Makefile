src = PKGBUILD

meta:
	@echo Note Arch makepkg does not run successfully when run under GNU make.
	@echo
	@echo 'So use "makepkg [options]" to build the package[s].'
	@echo
	@echo "Updating Arch package meta info .."
	@echo
	updpkgsums
	mksrcinfo

install:
	@echo Arch makepkg does not run successfully when run under GNU make.
	@echo
	@echo 'So use "makepkg -i" to install.'

check: $(src)
	namcap $^

clean:
	rm -rf *.sign *.xz *.log *.log.* *.pkg *.tar.gz *.part logpipe.* pkg/ src/

# vim: se ts=4:
