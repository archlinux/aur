# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-lzop
pkgver=1.04
pkgrel=1
pkgdesc="File compressor using lzo lib (mingw-w64)"
arch=('any')
url="http://www.lzop.org/"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-lzo')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.lzop.org/download/lzop-${pkgver}.tar.gz")
md5sums=('271eb10fde77a0a96b9cbf745e719ddf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/lzop-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/lzop-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf ${pkgdir}/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}
