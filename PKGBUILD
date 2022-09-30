# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=zoem
pkgver=21.341
pkgrel=1
pkgdesc='Zoem programming language'
arch=(x86_64)
url='https://micans.org/zoem/'
license=(GPL2)
depends=('readline')
makedepends=('cimfomfa')
options=('makeflags')
source=("https://micans.org/zoem/src/$pkgname-${pkgver/./-}.tar.gz")
sha256sums=('370efc7f999572888f4e722cbff40efba395a5435f192e734e7ff87810a68768')

prepare() {
  cd "$pkgname-${pkgver/./-}/src"
  sed -i '3s/^char/extern char/' "version.h"
}

build() {
  cd "$pkgname-${pkgver/./-}"
  export LDFLAGS="$LDFLAGS -Wl,--allow-multiple-definition"
  export CFLAGS="$CFLAGS -march=x86-64 -std=c11 -w"
  export CXXFLAGS="$CXXFLAGS -march=x86-64 -std=c++14 -w"
  autoreconf -i
  ./configure --prefix=/usr --enable-maintainer-mode
  make
}

package() {
  make -C "$pkgname-${pkgver/./-}" install DESTDIR="$pkgdir"
}
