pkgname=mingw-w64-coin-or-asl
pkgver=2.1.0
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
        https://coin-or-tools.github.io/ThirdParty-ASL/solvers-20241108.tgz)
sha256sums=('633e9d42b015a5a6a9ae324cac5736af1605fb74eb18299a54912b67d1a69be7'
            '7ffe7541a5b1a347124f909a0e260c1784f698b78ff24b145d0b11be635292e5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "ThirdParty-ASL-releases-$pkgver"
  ln -sf ../solvers .
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
