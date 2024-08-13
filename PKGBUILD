pkgname=mingw-w64-kokkos
pkgver=4.4.00
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem (mingw-w64)"
license=('Apache')
arch=('any')
url="https://github.com/kokkos/kokkos"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('3c9a376e4304268b647d06469fc9baacf1ece8bba6dad7b119edf262ef59f75079114da6d3d799615e92530358c300c27aa9da151efdf62c7d822a0b020428ea')

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
