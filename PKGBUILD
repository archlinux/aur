pkgname=mingw-w64-kokkos
pkgver=4.5.00
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem (mingw-w64)"
license=('Apache')
arch=('any')
url="https://github.com/kokkos/kokkos"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('3bc9a3b63352771456ea4d16d0137ad1e8dd19add2402713adccc99e5e54046dda0749ed9bef0cd178eae1063f0d42b487b71296cab0cde64312527d59d07c7a')

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
