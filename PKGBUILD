# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_pkgname=libheif
pkgname=lib32-libheif
pkgver=1.16.1
pkgrel=1
pkgdesc="HEIF file format decoder and encoder (32-bit)"
arch=('x86_64')
url="https://github.com/strukturag/libheif"
license=('GPL3')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-aom'
  'lib32-libde265'
  "libheif=${pkgver}"
)
makedepends=(
  'lib32-libjpeg'
  'lib32-libpng'
)
optdepends=(
  'lib32-libjpeg: for heif-convert and heif-enc'
  'lib32-libpng: for heif-convert and heif-enc'
  'lib32-svt-av1: svt-av1 encoder'
  'lib32-rav1e: rav1e encoder'
)
provides=('libheif.so')
source=("https://github.com/strukturag/libheif/releases/download/v${pkgver}/libheif-${pkgver}.tar.gz")
sha256sums=('ac15b54b6d7c315710e156d119b8a1bfc89f29621e99222b2750b1f31c9c3558')

build() {

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DAOM_ENCODER=ON

  cmake --build build
}

package() {
  depends+=(
    'lib32-aom' 'libaom.so'
    'lib32-libdav1d' 'libdav1d.so'
    'lib32-gdk-pixbuf2' 'libgdk_pixbuf-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
    'lib32-libwebp' 'libsharpyuv.so'
    'lib32-x265' 'libx265.so'
  )
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
