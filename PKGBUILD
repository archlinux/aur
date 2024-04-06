pkgname=mingw-w64-kokkos
pkgver=4.3.00
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem (mingw-w64)"
license=('Apache')
arch=('any')
url="https://github.com/kokkos/kokkos"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('43d2388ed4299bfd9158a5a679d030006bc90b4d5c9e509fc42903439bbaf6fd73ceabaf29e10bf1d1074b1fb9151d8ea5390352043681b32e2fd5a71283c35c')

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
