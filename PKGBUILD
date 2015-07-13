# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Jose Neder <jlneder(at)gmail(dot)com>

pkgname=libhugetlbfs
pkgver=2.19
pkgrel=1
pkgdesc='interacts with the Linux hugetlbfs to make large pages available to applications in a transparent manner.'
url='http://sourceforge.net/projects/libhugetlbfs'
arch=(i686 x86_64)
depends=(perl)
checkdepends=(python2)
license=(GPL)
source=(http://downloads.sourceforge.net/libhugetlbfs/libhugetlbfs-$pkgver.tar.gz
        gcc51-compile.patch::https://github.com/libhugetlbfs/libhugetlbfs/commit/82743f2a4d8fc099b17cac7d3b8f83ea13328916.patch)
sha1sums=('9d67423a6137a14fcd7165ba74f687aa2e4465cf'
          'ea1de7ae6c7f02c73c9fa416b3240cae7f2c1b86')

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

  patch -p1 < ../gcc51-compile.patch
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
