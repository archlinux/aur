# Contributor: Andrew Gunnerson <andrewgunnerson@gmail.com>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=mingw-w64-libarchive
pkgver=3.6.0
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (mingw-w64)"
arch=(any)
url="http://www.libarchive.org/"
license=('BSD')
depends=(mingw-w64-crt mingw-w64-bzip2 mingw-w64-expat mingw-w64-lz4 mingw-w64-lzo mingw-w64-regex mingw-w64-nettle mingw-w64-openssl mingw-w64-xz mingw-w64-zlib mingw-w64-zstd)
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=("libarchive-${pkgver}.tar.gz::https://github.com/libarchive/libarchive/archive/v${pkgver}.tar.gz"
        "0001-libarchive-3.3.3-bcrypt-fix.patch")
sha256sums=('9f9c1a21e570242c0d2854964d5e9ce00bb87144c19feac282b027146a86d0e3'
            '2c318a025029998a9389eb99ab80f733c0fcf3b4888421879f2f6b4530d7f522')

prepare() {
  cd "${srcdir}/libarchive-${pkgver}"
  patch -p1 -i ${srcdir}/0001-libarchive-3.3.3-bcrypt-fix.patch
  autoreconf -fiv
}

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libarchive-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-xml2 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libarchive-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
