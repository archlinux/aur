pkgname=mingw-w64-coin-or-asl
pkgver=1.4.3
pkgrel=1
pkgdesc="COIN-OR autotools harness to build AMPL Solver Library (mingw-w64)"
arch=('any')
url="https://github.com/coin-or-tools/ThirdParty-ASL/"
license=('MIT')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'wget')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/coin-or-tools/ThirdParty-ASL/archive/releases/$pkgver.tar.gz"
        https://coin-or-tools.github.io/ThirdParty-ASL/solvers-64919f75f.tgz)
sha256sums=('0a4cfa7c6c5df72d8e1c4c3ce74633421f807115a679e85cb5569c41df9a9aaf'
            'e212926d1d797701adc901ef18eaab6b15edd13f9281dd8c9266e3cdaf8c2dd3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "ThirdParty-ASL-releases-$pkgver"
  ln -s ../solvers .
  # run configuration exe through wine
  sed -i "s|./a.out >arith.h|\$(MINGW_TARGET)-wine ./a.exe >arith.h|g" solvers/makefile.u
}

build() {
  cd "ThirdParty-ASL-releases-$pkgver"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    LDFLAGS="-lssp" ${_arch}-configure lt_cv_deplibs_check_method=pass_all ..
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
