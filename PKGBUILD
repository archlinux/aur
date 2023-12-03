# Maintainer: Letu Ren <fantasquex@gmail.com>

pkgname=boost-doxygen_xml2qbk
pkgver=1.83.0
pkgrel=1
_srcname=boost_${pkgver//./_}
pkgdesc="Boost.org geometry docutils doxygen_xml2qbk"
arch=(x86_64)
url="https://github.com/boostorg/geometry"
license=('custom')
depends=('gcc-libs')
makedepends=('icu')
source=("https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.bz2")
sha256sums=('6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e')

build() {
  local JOBS="$(sed 's/.*\(-j *[0-9]\+\).*/\1/' <<<$MAKEFLAGS)"

  cd $_srcname
  ./bootstrap.sh --with-toolset=gcc --with-icu
  ./b2 \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    toolset=gcc \
    cflags="$CPPFLAGS $CFLAGS -fPIC -O3 -ffat-lto-objects" \
    cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3 -ffat-lto-objects" \
    linkflags="$LDFLAGS" \
    $JOBS \
    libs/geometry/doc/src/docutils/tools/doxygen_xml2qbk
}

package() {
  cd $_srcname
  install -Dm755 -t $pkgdir/usr/bin ./dist/bin/doxygen_xml2qbk
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE_1_0.txt
}
