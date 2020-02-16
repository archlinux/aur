build:
	makepkg -cCsirfi


update: shasums srcinfo

shasums:
	checksums=$$(makepkg --noprogressbar -g | grep -E '^sha.*sums') && \
		sed -Ei "s/^sha.*sums.*/$${checksums}/" PKGBUILD

srcinfo:
	makepkg --printsrcinfo > .SRCINFO
