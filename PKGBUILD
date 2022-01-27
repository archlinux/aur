# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=mingw-w64-rhsrvany
pkgver=1.1
pkgrel=2
pkgdesc="Free equivalent of Windows 'srvany' (mingw-w64)"
arch=('any')
url="https://github.com/rwmjones/rhsrvany"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
provides=('rhsrvany')
options=('!strip' '!buildflags' 'staticlibs')
source=("rhsrvany-${pkgver}.tar.gz::https://github.com/rwmjones/rhsrvany/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('44e861476310ea1bab4dedf0a7736ba906e0037e7950909b9c48eadf72f7c170')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/rhsrvany-${pkgver}/"
  autoreconf -i
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/rhsrvany-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}
