pkgname=mingw-w64-pagmo
pkgver=2.20.0
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (mingw-w64)"
arch=('any')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('mingw-w64-boost' 'mingw-w64-onetbb' 'mingw-w64-nlopt' 'mingw-w64-coin-or-ipopt' 'mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/esa/pagmo2/archive/v${pkgver}.tar.gz")
sha256sums=('8d684e9a3667dcccc844489083906c35aba7610594c5fce0f4eccce9c2264f4d')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/pagmo2-$pkgver"
}

build() {
  cd "${srcdir}/pagmo2-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DPAGMO_WITH_EIGEN3=ON -DPAGMO_WITH_NLOPT=ON -DPAGMO_WITH_IPOPT=ON -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/pagmo2-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
