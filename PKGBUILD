# Contributor: Andrew Gunnerson <andrewgunnerson@gmail.com>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=mingw-w64-libarchive
pkgver=3.3.3
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (mingw-w64)"
arch=(any)
url="http://www.libarchive.org/"
license=(BSD)
depends=(mingw-w64-crt mingw-w64-bzip2 mingw-w64-expat mingw-w64-lz4 mingw-w64-openssl mingw-w64-xz mingw-w64-zlib)
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("libarchive-${pkgver}.tar.gz::https://github.com/libarchive/libarchive/archive/v${pkgver}.tar.gz")
sha256sums=('720da414e7aebb255fcdaee106894e4d30e2472ac1390c2c15b70c84c7479658')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "libarchive-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DENABLE_TEST=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libarchive-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
