pkgname=mingw-w64-kokkos
pkgver=4.2.01
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem (mingw-w64)"
license=('Apache')
arch=('any')
url="https://github.com/kokkos/kokkos"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d5696e35f8e2d2c6e7b1c9d4bfe9a41faa0699f5c1e04f8ceffb9272f99a60dc8d7eed5ed7228ab197f15a2c21d00713ed3a26a1c437706ec02f846457e286cb')

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
