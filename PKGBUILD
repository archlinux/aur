# Maintainter: <davorin.ucakar@gmail.com>

pkgname=mingw-w64-qrencode
pkgver=4.1.1
pkgrel=1
pkgdesc='C library for encoding data in a QR Code symbol. (mingw-w64)'
arch=('any')
_archs=('i686-w64-mingw32' 'x86_64-w64-mingw32')
depends=(mingw-w64-libpng)
makedepends=('mingw-w64-configure')
license=('LGPL')
url="https://fukuchi.org/works/qrencode/"
source=(https://fukuchi.org/works/qrencode/qrencode-${pkgver}.tar.bz2)
sha512sums=('981b3242c213e1b40ac88711912dd8c27ea11f3437d1a04b6b226499a6e991a8f0b3b10f818bcc104812192a1dac4ce05f16ecd847a50cb03d4859b84bad89b8')
options=(staticlibs '!strip' '!buildflags')

build() {
  export MINGW_LDFLAGS="-s"
  cd "${srcdir}/qrencode-${pkgver}"
  for _arch in ${_archs[@]}; do
    mkdir build-${_arch} -p
    pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  cd "${srcdir}/qrencode-${pkgver}"

  install -d "${pkgdir}"/usr/bin

  for _arch in ${_archs[@]}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}/bin" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}/lib" -name "*.a"   -exec ${_arch}-strip -g {} \;
    popd
  done
}
