# Maintainter: <davorin.ucakar@gmail.com>

pkgname=mingw-w64-qrencode
pkgver=4.0.2
pkgrel=1
pkgdesc='C library for encoding data in a QR Code symbol. (mingw-w64)'
arch=('any')
_archs=('i686-w64-mingw32' 'x86_64-w64-mingw32')
depends=(mingw-w64-libpng)
# makedepends=('mingw-w64-sdl')
license=('LGPL')
url="https://fukuchi.org/works/qrencode/"
source=(https://fukuchi.org/works/qrencode/qrencode-${pkgver}.tar.bz2)
md5sums=('3eb64357f6fbdb68c27cb2e44e97280a')
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
