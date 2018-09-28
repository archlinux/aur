PKG=pkg/p7zip-natspec
PKGINFO=$(PKG)/.PKGINFO
TESTFILES_URL="https://www.dropbox.com/sh/hlop0d07h5n2172/AAAcO5crCxqJuVdF_0WLxuTua?dl=0"

.PHONY: all clean test check_upstream _test lint

all: $(PKGINFO) test .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

$(PKGINFO): PKGBUILD
	makepkg

testfiles/:
	mkdir -p $@
	curl -L "$(TESTFILES_URL)" | bsdtar -C $@ -xf -

clean:
	rm -rf testfiles src pkg *.pkg.tar.*

check_upstream:
	./check_upstream

test: $(PKGINFO) testfiles/
	$(MAKE) -s _test LANG=ja_JP.UTF-8 TESTFILE=testfiles/SHIFT_JIS.zip PATTERN="解凍すると文字化けするかも.txt"
	$(MAKE) -s _test LANG=ja_JP.UTF-8 TESTFILE=testfiles/UTF8.zip PATTERN="UTF-8固有文字列_( ◕‿‿◕ ).txt"

_test: 
	LD_LIBRARY_PATH=$(PKG)/usr/lib $(PKG)/usr/bin/7z l $(TESTFILE) | grep -qe "$(PATTERN)" && echo ok

lint:
	namcap PKGBUILD
