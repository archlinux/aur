pkgname=mingw-w64-scipoptsuite
pkgver=7.0.3
pkgrel=1
pkgdesc="Toolbox for generating and solving optimization problems. (mingw-w64)"
arch=('any')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
depends=('mingw-w64-gmp' 'mingw-w64-readline' 'mingw-w64-regex' 'mingw-w64-zlib' 'mingw-w64-gsl' 'mingw-w64-coin-or-ipopt' 'mingw-w64-onetbb')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!strip' '!buildflags')
source=("http://scip.zib.de/download/release/scipoptsuite-${pkgver}.tgz")
sha256sums=('5af5185a6e60cc62d1a89e3ac4fe22d32351a5158c2c04a95e180e76eb98cc07')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/scipoptsuite-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -Dlibs="regex;gfortran" -DGCG=OFF -DIPOPT_DIR=/usr/${_arch}/ -DBUILD_TESTING=OFF ..
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

