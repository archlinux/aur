# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: xantares

pkgname=mingw-w64-libzip
pkgver=1.11.2
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (mingw-w64)"
url="http://www.nih.at/libzip/index.html"
license=('BSD-3-Clause')
arch=(any)
depends=('mingw-w64-xz' 'mingw-w64-zlib' 'mingw-w64-bzip2' 'mingw-w64-openssl' 'mingw-w64-gnutls')
makedepends=('mingw-w64-cmake' 'ninja')
options=('staticlibs' '!buildflags' '!debug' '!strip')
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.xz")
sha256sums=('5d471308cef4c4752bbcf973d9cd37ba4cb53739116c30349d4764ba1410dfc1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_pkgname="libzip"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch}-static -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_DOC=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_REGRESS=OFF \
      -DBUILD_TOOLS=OFF \
      -DBUILD_SHARED_LIBS=OFF

    ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch} -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_DOC=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_REGRESS=OFF \
      -DBUILD_TOOLS=OFF

    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
