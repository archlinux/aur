# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>

_commit=8031fe436984a3431bdb0e4e71e6ae6df97fb80f
pkgname=bracmat-git
pkgver=6.13.0.r271
pkgrel=1
pkgdesc='Programming language for symbolic computation with pattern matching features'
arch=('i686' 'x86_64')
url='https://github.com/BartJongejan/Bracmat'
license=('GPL2')
makedepends=('git')
provides=('bracmat')
conflicts=('bracmat')
source=("git+$url.git#commit=$_commit"
        'path-to-help.patch')
md5sums=('SKIP'
         '99837b2909221895b234f4cf5efd6864')

pkgver() {
	sed -nr 'N;s/#define VERSION "([0-9\.]+)"\n#define BUILD "([0-9]+)"/\1.r\2/p;D'\
			"$srcdir/Bracmat/src/bracmat.c"
}

prepare() {
	cd "$srcdir/Bracmat/src"
	patch -i "$srcdir/path-to-help.patch"
}

build() {
	cd "$srcdir/Bracmat/src"
	make bracmat
	make bracmatsafe
}

package() {
	install -d                                "$pkgdir"/usr/bin
	install "$srcdir"/Bracmat/src/bracmat     "$pkgdir"/usr/bin
	install "$srcdir"/Bracmat/src/bracmatsafe "$pkgdir"/usr/bin

	install -d                                "$pkgdir"/usr/share/bracmat/web
	install -m644 "$srcdir"/Bracmat/web/*     "$pkgdir"/usr/share/bracmat/web
	install -m644 "$srcdir"/Bracmat/*.bra     "$pkgdir"/usr/share/bracmat
	install -m644 "$srcdir"/Bracmat/*.xml     "$pkgdir"/usr/share/bracmat

	install -d                                "$pkgdir"/usr/share/doc/bracmat
	install -m644 "$srcdir"/Bracmat/doc/*     "$pkgdir"/usr/share/doc/bracmat
	install -m644 "$srcdir"/Bracmat/*.md      "$pkgdir"/usr/share/doc/bracmat
	install -m644 "$srcdir"/Bracmat/Changelog "$pkgdir"/usr/share/doc/bracmat/changelog.txt

	cd "$srcdir"/Bracmat/src
	make clean  &> /dev/null
}
