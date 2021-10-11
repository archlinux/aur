# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=libexif
pkgname=mingw-w64-libexif
pkgver=0.6.23
pkgrel=1
pkgdesc="A library to parse an EXIF file and read the data from those tags (mingw-w64)"
arch=('any')
url="https://github.com/libexif/libexif"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=('!strip' '!buildflags' 'staticlibs')
source=(${url}/archive/${_pkgname}-${pkgver//./_}-release.tar.gz)
sha256sums=('7701ec4b7071b1ac4f253c6d2478851c3baa5287302c336f68dd1810e8902bae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver//./_}-release"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver//./_}-release"
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
    cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver//./_}-release/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    find "${pkgdir}/usr" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
  done
}
