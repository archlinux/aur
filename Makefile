7Z=pkg/7zip-natspec/usr/bin/7z
PKGVER=$(shell awk -F'= ' '/pkgver/{print $$2}' <pkg/7zip-natspec/.PKGINFO)

.PHONY: all clean test check
all: $(7Z) test .SRCINFO check

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

$(7Z): PKGBUILD
	makepkg -f

clean:
	rm -rf src pkg *.pkg.tar.*

test: $(7Z)
	$(7Z) l test_SHIFT_JIS.zip | grep -qe '解凍すると文字化けするかも.txt'
	$(7Z) l test_UTF8.zip | grep -qe 'UTF-8固有文字列_( ◕‿‿◕ ).txt'

check:
	namcap PKGBUILD
	namcap 7zip-natspec-$(PKGVER)-*.pkg.tar.*
