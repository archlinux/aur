pkgname=libcuba
pkgver=4.2.2
pkgrel=1
pkgdesc='A library for multidimensional numerical integration'
arch=('x86_64')
url="https://feynarts.de/cuba/"
license=('LGPL')
makedepends=('make' 'automake' 'gcc')
options=('staticlibs' '!lto')
source=("https://feynarts.de/cuba/Cuba-$pkgver.tar.gz")
sha256sums=('8d9f532fd2b9561da2272c156ef7be5f3960953e4519c638759f1b52fe03ed52')

prepare() {
  cd "$srcdir/Cuba-$pkgver"

  # gcc 15: false' is a keyword with '-std=c23' onwards
  sed -i "/typedef enum/d" src/common/stddecl.h
  sed -i "27i#include <stdbool.h>" src/common/stddecl.h
}

build() {
  cd "$srcdir/Cuba-$pkgver"
  CFLAGS="-fPIC ${CFLAGS}" ./configure --prefix=/usr
  make -j1
}

check() {
  cd "$srcdir/Cuba-$pkgver"
  make -k check -j1
}

package() {
  cd "$srcdir/Cuba-$pkgver"
  make install -j1 DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/bin
}
