# Contributor: Ivy Foster <ivy.foster@gmail.com>

pkgname='rrootage'
pkgver='0.23a'
pkgrel=1
pkgdesc='rRootage is an abstract shooter, created by Kenta Cho and ported to Linux by Evil Mr Henry.'
url='http://rrootage.sourceforge.net/'
license=('custom:rrootage')
changelog='rrootage.changelog'

arch=('x86_64' 'i686')
depends=('libbulletml' 'sdl_mixer')
source=("http://downloads.sourceforge.net/rrootage/rRootage-$pkgver.tar.gz"
	http://ftp.de.debian.org/debian/pool/main/r/rrootage/rrootage_0.23a-9.diff.gz)
sha1sums=('8b63bfe17fd311ade6983ec99ec53e44cb8ee3f1'
	'0674a153ccbd9bdb8e675cbe9c6b2ed79ee53361')

prepare() {
	cd rRootage

	# Unpack the patches
	patch -Np1 <"$srcdir"/rrootage_0.23a-9.diff
	# *sigh* patch the patch
	sed 's/windowMode = 0/windowMode = 1/' \
		-i debian/patches/09_rrootage_make_highres_default.patch
	sed -e '/^Medium resolution mode/ s/ (default)//' \
		-e '/^High resolution mode/ s/\.$/ (default)./' \
		-i debian/rrootage.6

	for patch in debian/patches/*.patch; do
		patch -Np1 <"$patch"
	done
}

build() {
	cd rRootage
	make -C src -f makefile.lin
}

package() {
	cd rRootage

	install -d "$pkgdir"/usr/share/games
	cp -r rr_share "$pkgdir"/usr/share/games/rrootage
	install -D src/rrootage "$pkgdir"/usr/bin/rrootage

	install -D -m 644 readme.txt "$pkgdir"/usr/share/licenses/rrootage/README.jp
	install -m 644 readme_e.txt "$pkgdir"/usr/share/licenses/rrootage/README.en

	install -D -m 644 readme.txt "$pkgdir"/usr/share/doc/rrootage/README.jp
	install -m 644 readme_e.txt "$pkgdir"/usr/share/doc/rrootage/README.en
	install -m 644 readme_linux "$pkgdir"/usr/share/doc/rrootage/README

	install -D -m 644 debian/rrootage.6 "$pkgdir"/usr/share/man/man6/rrootage.6
	install -D -m 644 debian/rrootage.desktop \
		"$pkgdir"/usr/share/applications/rrootage.desktop
	install -D -m 644 debian/rrootage.xpm "$pkgdir"/usr/share/pixmaps/rrootage.xpm
}
