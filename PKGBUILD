# Maintainer: Ivy Foster <ivy.foster@gmail.com>
# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
# Contributor: Andy Kosela <spear@protect-ya-neck.com>

pkgname='frotz'
pkgver='2.44'
pkgrel=3
pkgdesc='Z-machine interpreter for interactive fiction games.'
arch=('i686' 'x86_64')
url='http://frotz.sourceforge.net/'
license=('GPL')
source=("https://github.com/DavidGriffith/frotz/archive/$pkgver.tar.gz")
sha256sums=('dbb5eb3bc95275dcb984c4bdbaea58bc1f1b085b20092ce6e86d9f0bf3ba858f')

prepare() {
	cd "frotz-$pkgver"
	sed -e '/^OPTS =/d' \
		-e '/^PREFIX/ s:/usr/local:/usr:' \
		-e '/^CONFIG_DIR = $(PREFIX)/ s/^/#/' \
		-e '/^CONFIG_DIR/ s:/usr/local::' \
		-e '/^CURSES/ s/-lcurses/-lncurses/' \
		-e '/^#CURSES_DEF/ s/^#//' \
		-i Makefile
}

build() {
	cd "frotz-$pkgver"
	make
	# From INSTALL: "This option is provided for hysterical raisins"
	make dumb
}

package() {
	cd "frotz-$pkgver"

	# Upstream's Makefile doesn't respect $destdir...yet
	install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/{doc/frotz,man/man6}
	install -m 755 frotz dfrotz "$pkgdir"/usr/bin
	install -m 644 doc/frotz.6 doc/dfrotz.6 "$pkgdir"/usr/share/man/man6
	install -m 644 doc/frotz.conf-{big,small} "$pkgdir"/usr/share/doc/frotz
}
