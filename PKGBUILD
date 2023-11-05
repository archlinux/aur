# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_pkgname=libheif
pkgname=lib32-libheif
pkgver=1.17.3
pkgrel=1
pkgdesc="HEIF file format decoder and encoder (32-bit)"
arch=('x86_64')
url="https://github.com/strukturag/libheif"
license=('GPL3')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  "libheif=${pkgver}"
)
makedepends=(
  'cmake'
  'lib32-gdk-pixbuf2'
  'lib32-libwebp'
  'lib32-libjpeg'
  'lib32-libpng'
  'lib32-svt-av1'
  'lib32-rav1e'
  'lib32-libde265'
  'lib32-x265'
  'lib32-libdav1d'
  'lib32-aom'
)
optdepends=(
  'lib32-libjpeg: for heif-convert-32 and heif-enc-32'
  'lib32-libpng: for heif-convert-32 and heif-enc-32'
  'lib32-svt-av1: svt-av1 encoder'
  'lib32-rav1e: rav1e encoder'
  'lib32-libde265: de265 encoder'
  'lib32-x265: x265 encoder'
  'lib32-aom: AOM plugin'
  'lib32-libdav1d: DAV1D encoder'
)
provides=('libheif.so')
source=("https://github.com/strukturag/libheif/releases/download/v${pkgver}/libheif-${pkgver}.tar.gz")
sha256sums=('8d5b6292e7931324f81f871f250ecbb9f874aa3c66b4f6f35ceb0bf3163b53ea')

build() {

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DWITH_AOM_DECODER_PLUGIN=ON \
    -DWITH_AOM_ENCODER_PLUGIN=ON \
    -DWITH_DAV1D_PLUGIN=ON \
    -DWITH_LIBDE265_PLUGIN=ON \
    -DWITH_X265_PLUGIN=ON \

  cmake --build build
}

package() {
  depends+=(
    'lib32-gdk-pixbuf2' 'libgdk_pixbuf-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
    'lib32-libwebp' 'libsharpyuv.so'
  )
  DESTDIR="${pkgdir}" cmake --install build

  (
  cd "${pkgdir}/usr/bin"
    mv heif-convert heif-convert-32
    mv heif-enc heif-enc-32
    mv heif-thumbnailer heif-thumbnailer-32
    mv heif-info heif-info-32
  )

  rm -rf "${pkgdir}/usr/"{include,share}
}
