pkgname=mingw-w64-coin-or-coinmetis
pkgver=1.3.8
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
sha256sums=('97bf0f8787c1a6491fd2de2a8053872d7786d00b29cb574c851c32cd9aae3673')

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
