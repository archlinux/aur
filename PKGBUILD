# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libexif
pkgver=0.6.21
pkgrel=1
pkgdesc="A library to parse an EXIF file and read the data from those tags (mingw-w64)"
arch=('any')
url="https://sourceforge.net/projects/libexif"
license=('LGPL')
makedepends=('mingw-w64-configure' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/sourceforge/libexif/libexif-${pkgver}.tar.bz2")
md5sums=('27339b89850f28c8f1c237f233e05b27')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libexif-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-docs
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libexif-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    find "${pkgdir}/usr" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
  done
}
