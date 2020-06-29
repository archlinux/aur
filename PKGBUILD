pkgname=mingw-w64-pagmo
pkgver=2.15.0
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (mingw-w64)"
arch=('any')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('mingw-w64-boost' 'mingw-w64-tbb' 'mingw-w64-nlopt' 'mingw-w64-coin-or-ipopt')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/esa/pagmo2/archive/v${pkgver}.tar.gz")
sha256sums=('07977be690b512ea11fc40d5b8bfa0a7a8507ce9053a615c2bc4725d355ef9a8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/pagmo2-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DPAGMO_WITH_EIGEN3=ON -DPAGMO_WITH_NLOPT=ON -DPAGMO_WITH_IPOPT=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/pagmo2-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
