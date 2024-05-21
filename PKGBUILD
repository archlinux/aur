# Maintainer: Emily Ellis <emily@scgtrp.net>
pkgname=gcmc
pkgver=1.9.0
pkgrel=1
pkgdesc="G-code meta-compiler"
depends=('glibc' 'readline')
arch=(x86_64)
url="http://www.vagrearg.org/content/gcmc"
license=('GPL-3.0-or-later')
source=("http://www.vagrearg.org/gcmc/gcmc-$pkgver.tar.gz")
sha512sums=('7562670cbad67d95522cee20b39fd5402151efbb8058ec1c0855df0d03bdbbf7c555dbbb3af0e4486bd333307734bbdd2dd49c4e73f3a52c1ebdfead8a9995a9')

prepare() {
	cd "$pkgname-$pkgver"
	# colors.gcmc is listed twice, which makes make install fail
	awk '!/colors\.gcmc/ || ++n != 2' ./example/Makefile.am >./example/Makefile.am.new
	mv ./example/Makefile.am.new ./example/Makefile.am
	aclocal
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
