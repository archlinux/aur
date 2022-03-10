pkgname=mingw-w64-coin-or-asl
pkgver=2.0.0
pkgrel=1
pkgdesc="COIN-OR autotools harness to build AMPL Solver Library (mingw-w64)"
arch=('any')
url="https://github.com/coin-or-tools/ThirdParty-ASL/"
license=('MIT')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-crt')
provides=('mingw-w64-coin-or-coinasl')
conflicts=('mingw-w64-coin-or-coinasl')
replaces=('mingw-w64-coin-or-coinasl')
makedepends=('mingw-w64-configure' 'mingw-w64-wine')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/coin-or-tools/ThirdParty-ASL/archive/releases/$pkgver.tar.gz"
        https://coin-or-tools.github.io/ThirdParty-ASL/solvers-64919f75f.tgz)
sha256sums=('b617b6d46a2722189dedef7c8013f7e21ebe677fe34cc6b62fabb1639fd3a96d'
            'e212926d1d797701adc901ef18eaab6b15edd13f9281dd8c9266e3cdaf8c2dd3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "ThirdParty-ASL-releases-$pkgver"
  ln -sf ../solvers .
  # run configuration exe through wine
  sed -i "s|./arithchk\$(EXEEXT)|\$(MINGW_TARGET)-wine ./arithchk\$(EXEEXT)|g" Makefile.in
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
