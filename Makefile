all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

test: systemc
	testing-x86_64-build -c -- -n -I systemc/systemc-*.pkg*

quick-test:
	makepkg -sf
	find -maxdepth 1 -type f -name 'archc-git-*.pkg*' ! -name '*.log' | xargs namcap

systemc:
	# Make systemc dependency from AUR
	if [ ! -f systemc/systemc-*.pkg* ] ; then \
		rm -rf systemc/ && \
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/systemc.tar.gz && \
		tar xf systemc.tar.gz && \
		cd systemc && makepkg ;\
	fi

clean:
	rm -rf ArchC/ pkg/ src/ systemc/ *.log archc-git-*.pkg*

.PHONY: all test quick-test systemc clean
