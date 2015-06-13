# Maintainer: Thomas Poechtrager <tpoechtrager at g m a i l>

pkgname=mingw-w64-libgeoip
pkgver=1.6.5
pkgrel=1
pkgdesc="Non-DNS IP-to-country resolver C library (mingw-w64)"
arch=(any)
url="http://www.maxmind.com/app/c"
license=('LGPL')
makedepends=(mingw-w64-configure mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=(https://github.com/maxmind/geoip-api-c/releases/download/v${pkgver}/GeoIP-${pkgver}.tar.gz)
sha256sums=('0ae1c95e69ad627d3a45cb897f79ce0c30f13fcd4b4a0dda073be0c9552521b3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/GeoIP-${pkgver}

  sed -i 's/$as_echo "#define malloc rpl_malloc" >>confdefs.h//g' configure
  sed -i 's/$as_echo "#define realloc rpl_realloc" >>confdefs.h//g' configure

  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/GeoIP-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
