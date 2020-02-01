pkgname=mingw-w64-coin-or-coinmetis
pkgver=1.3.9
pkgrel=1
pkgdesc="COIN-OR autotools harness to build Metis (mingw-w64)"
arch=('any')
url="https://github.com/coin-or-tools/ThirdParty-Metis/"
license=('custom')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'wget')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/coin-or-tools/ThirdParty-Metis/archive/releases/$pkgver.tar.gz")
sha256sums=('c75e66ec76b423e4c8c1ead3579fb2aa5fb7844f4efffdeae5b185df80420e3a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "ThirdParty-Metis-releases-$pkgver"
  ./get.Metis
}

build() {
  cd "ThirdParty-Metis-releases-$pkgver"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS="-lssp" ${_arch}-configure lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ThirdParty-Metis-releases-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
