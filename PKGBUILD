# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=zebedee
pkgver=2.5.3
pkgrel=1
pkgdesc="A simple program to establish an encrypted, compressed "tunnel" for TCP/IP or UDP data transfer between two systems."
arch=('x86_64')
url="https://github.com/AriaMoradi/zebedee"
license=('GPL2')
depends=()
makedepends=(git)
source=('zebedee::git+https://github.com/AriaMoradi/zebedee.git')
md5sums=('SKIP')

prepare() {
	cd $srcdir/$pkgname
	tar xvf zebedee-2.5.3.tar.gz
	tar xvf zlib-1.2.3.tar.gz
	tar xvf blowfish-0.9.5a.tar.gz
	tar xvf bzip2-1.0.3.tar.gz

	# patch the Makefile so it builds successfully and accepts a DESTDIR value
	cd zebedee-2.5.3
	patch --forward --strip=1 --input="${srcdir}/../zebedee.patch"
	cd ..
}

build() {
	cd $srcdir/$pkgname

	cd blowfish-0.9.5a
	make optimize
	cd ..

	cd zlib-1.2.3
	./configure
	make
	cd ..

	cd bzip2-1.0.3
	make
	cd ..

	cd zebedee-2.5.3
	make OS=linux64
}

package() {
	cd $srcdir/$pkgname/$pkgname-$pkgver	
	make DESTDIR="$pkgdir/" OS=linux64 install
}
