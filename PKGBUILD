pkgname=mingw-w64-kokkos
pkgver=4.7.01
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem (mingw-w64)"
license=('Apache')
arch=('any')
url="https://github.com/kokkos/kokkos"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('a37bc0f2f428d26cc18872c3241c1f5929fcf982d3ee3e29e1acc0c0bab7531463769adff56bdcea4995350d7b6999b97c0fe77757a970699401f46ed2c48141')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd kokkos-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DKokkos_ENABLE_OPENMP=ON -DBUILD_TESTING=OFF .
    make -C build-${_arch}
  done
}

package() {
  cd kokkos-$pkgver
  for _arch in ${_architectures}; do
    make install -C build-${_arch} DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
