# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-lzlib
pkgver=1.12
pkgrel=1
pkgdesc="Lzlib is a data compression library providing in-memory LZMA compression and decompression functions (mingw-w64)"
arch=('any')
url="https://www.nongnu.org/lzip/lzlib.html"
license=('2-clause BSD')
depends=()
makedepends=('mingw-w64-configure' 'mingw-w64-make')
options=('!strip' 'staticlibs' '!buildflags')

source=("http://download.savannah.gnu.org/releases/lzip/lzlib/lzlib-${pkgver}.tar.gz")
sha256sums=('8e5d84242eb52cf1dcc98e58bd9ba8ef1aefa501431abdd0273a22bf4ce337b1')

build() {
  cd "${srcdir}/lzlib-${pkgver}"
  for _arch in $_architectures; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-configure
    ${_arch}-make
    ## ${_arch}-make check
    popd
  done
}

package() {
  cd "${srcdir}/${_gitname}"
  for _arch in ${_architectures}; do
    cd "${srcdir}/lzlib-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" ${_arch}-make install
  done
}
