# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=hivex
pkgver=1.3.11
pkgrel=4
pkgdesc="System for extracting the contents of Windows Registry."
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("LGPL2")
depends=("libxml2" "perl")
makedepends=("python2" "ruby" "perl-io-stringy" "perl-test-simple" "ocaml-findlib" "ocaml")
options=("!emptydirs" "!libtool")
source=("http://libguestfs.org/download/$pkgname/$pkgname-$pkgver.tar.gz"
	static.patch)
md5sums=('be99b2db9913eab10b9b39219cec55a9'
         'd4fb9749eb385f61ae6777ea76c6a945')
# ocaml and python2 for libguestfs support
# TODO: I'll try migrate libguestfs to python3 if vdsm work with new python

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig <../static.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    unset PREFIX
    ./configure \
	--bindir=/usr/bin \
	--libdir=/usr/lib \
	--prefix=/usr \
	--disable-rpath \
	--disable-static PYTHON=python2
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
