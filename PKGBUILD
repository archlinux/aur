pkgname=mingw-w64-scipoptsuite
pkgver=6.0.2
pkgrel=1
pkgdesc="Toolbox for generating and solving optimization problems. (mingw-w64)"
arch=('any')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
depends=('mingw-w64-gmp' 'mingw-w64-readline' 'mingw-w64-libgnurx' 'mingw-w64-zlib' 'mingw-w64-gsl' 'mingw-w64-coin-or-ipopt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!strip' '!buildflags')
source=("http://scip.zib.de/download/release/scipoptsuite-${pkgver}.tgz")
sha256sums=('e25329a2ed4fbdde8a32279a4c955ee7a8b8795429b6e7105ae17998c2ecbe66')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/scipoptsuite-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -Dlibs=gnurx -DGCG=OFF -DIPOPT_DIR=/usr/${_arch}/ ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/scipoptsuite-${pkgver}/build-${_arch}"
    make install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

