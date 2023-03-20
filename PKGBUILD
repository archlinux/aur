pkgname=mingw-w64-pagmo
pkgver=2.19.0
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (mingw-w64)"
arch=('any')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('mingw-w64-boost' 'mingw-w64-onetbb' 'mingw-w64-nlopt' 'mingw-w64-coin-or-ipopt' 'mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/esa/pagmo2/archive/v${pkgver}.tar.gz")
sha256sums=('701ada528de7d454201e92a5d88903dd1c22ea64f43861d9694195ddfef82a70')

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
