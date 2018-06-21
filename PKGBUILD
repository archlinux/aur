pkgname=mingw-w64-mpfi
pkgver=1.5.3
pkgrel=1
pkgdesc="C library for interval arithmetic (mingw-w64)"
arch=('any')
url="http://perso.ens-lyon.fr/nathalie.revol/software.html"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-mpfr')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gforge.inria.fr/frs/download.php/file/37332/mpfi-${pkgver}.tar.gz")
sha256sums=('beed2003fdbedf590e8dd6edb4f2321e609e329df99ed4139cd66d7ebbc41240')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/mpfi-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpfi-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
