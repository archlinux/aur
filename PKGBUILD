# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Andrew Gunnerson <andrewgunnerson@gmail.com>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=mingw-w64-libarchive
_pkgname=libarchive
pkgver=3.8.9
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (mingw-w64)"
arch=(any)
url="http://www.libarchive.org/"
license=('BSD-2-Clause')
depends=(mingw-w64-crt mingw-w64-bzip2 mingw-w64-expat mingw-w64-lz4 mingw-w64-lzo mingw-w64-regex mingw-w64-nettle mingw-w64-openssl mingw-w64-xz mingw-w64-zlib mingw-w64-zstd)
makedepends=('mingw-w64-configure')
options=('!buildflags' '!debug' 'staticlibs' '!strip')
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-shared \
      --enable-static \
      --without-libiconv-prefix \
      --without-xml2 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
