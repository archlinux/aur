pkgname=mingw-w64-coin-or-coinasl
pkgver=1.4.1
pkgrel=1
pkgdesc="COIN-OR autotools harness to build AMPL Solver Library (mingw-w64)"
arch=('any')
url="https://github.com/coin-or-tools/ThirdParty-ASL/"
license=('MIT')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'wget')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/coin-or-tools/ThirdParty-ASL/archive/releases/$pkgver.tar.gz")
sha256sums=('c6fa24ab952243f10f5231d49a46c206d239cffe5793f0ae46651adcc4da0b45')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "ThirdParty-ASL-releases-$pkgver"
  ./get.ASL

  # run configuration exe through wine
  sed -i "s|./a.out >arith.h|\$(MINGW_TARGET)-wine ./a.exe >arith.h|g" solvers/makefile.u
}

build() {
  cd "ThirdParty-ASL-releases-$pkgver"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure lt_cv_deplibs_check_method=pass_all ..
    make MINGW_TARGET=${_arch}
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ThirdParty-ASL-releases-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
