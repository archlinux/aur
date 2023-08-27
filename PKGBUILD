# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: xantares

pkgname=mingw-w64-libzip
pkgver=1.10.1
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (mingw-w64)"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=(any)
depends=('mingw-w64-xz' 'mingw-w64-zlib' 'mingw-w64-bzip2' 'mingw-w64-openssl' 'mingw-w64-gnutls')
makedepends=('mingw-w64-cmake' 'ninja')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.xz")
sha256sums=('dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318')

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
}
