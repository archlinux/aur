# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-yasm
_pkgname=yasm
pkgver=1.3.0
pkgrel=1
pkgdesc="A rewrite of NASM to allow for multiple syntax supported (NASM, TASM, GAS, etc.) (mingw-w64)"
arch=('any')
url="http://www.tortall.net/projects/yasm/"
license=('BSD' 'GPL2' 'LGPL2.1' 'PerlArtistic')
depends=('mingw-w64-crt' 'mingw-w64-wine')
makedepends=('mingw-w64-configure' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.tortall.net/projects/yasm/releases/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('b7574e9f0826bedef975d64d3825f75fbaeef55e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    
    # symbolic links
    mkdir -p "${pkgdir}/usr/bin"
    for _i in yasm vsyasm ytasm; do
      ln -s "/usr/${_arch}/bin/${_i}.exe" "${pkgdir}/usr/bin/${_arch}-${_i}"
    done
  done
}
