pkgname=mingw-w64-coin-or-coinmumps
pkgver=3.0.7
pkgrel=2
pkgdesc="COIN-OR autotools harness to build MUMPS (mingw-w64)"
arch=('any')
url="https://github.com/coin-or-tools/ThirdParty-MUMPS/"
license=('custom')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-metis' 'mingw-w64-lapack')
makedepends=('mingw-w64-configure' 'wget')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/coin-or-tools/ThirdParty-Mumps/archive/releases/$pkgver.tar.gz")
sha256sums=('3847b3665e7235ead8710b13ee7f19159926e33a640a0225c08ad766db02d761')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "ThirdParty-Mumps-releases-$pkgver"
  ./get.Mumps
}

build() {
  cd "ThirdParty-Mumps-releases-$pkgver"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    FFLAGS="-fallow-argument-mismatch" LIBS="-lssp" ${_arch}-configure lt_cv_deplibs_check_method=pass_all ..
    make -j1
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ThirdParty-Mumps-releases-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
