# Maintainer: Philipp Classen <philipp.classen@posteo.de>
# Original maintainer: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Jose Neder <jlneder(at)gmail(dot)com>

pkgname=libhugetlbfs
pkgver=2.20
pkgrel=1
pkgdesc='interacts with the Linux hugetlbfs to make large pages available to applications in a transparent manner.'
url='https://github.com/libhugetlbfs/libhugetlbfs'
arch=(i686 x86_64)
depends=(perl)
checkdepends=(python2)
license=(GPL)
source=(https://github.com/libhugetlbfs/libhugetlbfs/releases/download/$pkgver/libhugetlbfs-$pkgver.tar.gz)
sha1sums=('279b372fb4da4294946308928f1112e9be5ae6b8')

_options='BUILDTYPE=NATIVEONLY'
if [ "$CARCH" = "x86_64" ]; then
  _options="$_options LIB32= LIB64=lib"
else
  _options="$_options LIB32=lib LIB64="
fi

prepare() {
  cd libhugetlbfs-$pkgver
  sed 's|/lib64/perl5/TLBC|/lib/perl5/TLBC|g;s|/lib/perl5/TLBC|/lib/perl5/vendor_perl/TLBC|g' -i Makefile
  sed 's|/usr/bin/env python|/usr/bin/env python2|g' -i tests/run_tests.py
}

build() {
  cd libhugetlbfs-$pkgver
  make $_options
}

check() {
  cd libhugetlbfs-$pkgver
  make $_options check
}

package() {
  cd libhugetlbfs-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install $_options
}
