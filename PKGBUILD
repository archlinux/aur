# Maintainer: Samueru-sama <xdglawyer@outlook.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif-noglycin
pkgver=1.21.2
pkgrel=2
pkgdesc='An HEIF and AVIF file format decoder and encoder, for gdk-pixbuf2-noglycin'
arch=('x86_64' 'aarch64')
url='https://github.com/strukturag/libheif'
license=(LGPL-3.0-or-later)
provides=('libheif' 'libheif.so')
conflicts=(libheif)
makedepends=(cmake
             dav1d
             ffmpeg
             gdk-pixbuf2-noglycin
             git
             libjpeg-turbo
             libpng
             libtiff
             openjpeg2
             rav1e
             svt-av1)
depends=(aom libaom.so
         glibc libgcc_s.so
         libde265 #libde265.so
         libgcc libgcc_s.so
         libstdc++ libstdc++.so
         libwebp libsharpyuv.so
         openh264 libopenh264.so
         openh264 libopenh264.so
         x264 libx264.so
         x265 libx265.so)
optdepends=('libjpeg-turbo: for heif-dec and heif-enc'
            'libpng: for heif-dec and heif-enc'
            'libtiff: for heif-dec and heif-enc'
            'dav1d: dav1d encoder'
            'ffmpeg: hardware decode'
            'openjpeg2: JPEG2000 decoder'
            'rav1e: rav1e encoder'
            'svt-av1: svt-av1 encoder')
source=(git+https://github.com/strukturag/libheif#tag=v$pkgver
        svt-av1-4.patch)
sha256sums=('2eb27d784c24061f996af7d578af25282de08802d56bfaa674a1a3ae9e86acda'
            '84c9298918dcb1de59acb3eb25aff657eee2a602bf3d2572c93663dd1374b15f')

prepare() {
  patch -d ${pkgname%-noglycin} -p1 < svt-av1-4.patch
}

build() {
  cmake -B build -S ${pkgname%-noglycin} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DAV1D=ON \
    -DWITH_RAV1E=ON \
    -DWITH_FFMPEG_DECODER=ON \
    -DWITH_FFMPEG_DECODER_PLUGIN=ON \
    -DWITH_SvtEnc=ON \
    -DWITH_OpenJPEG_DECODER=ON \
    -DWITH_GDK_PIXBUF=OFF \
    -DWITH_EXAMPLE_HEIF_THUMB=OFF \
    -DWITH_OpenJPEG_DECODER=ON \
    -DWITH_GDK_PIXBUF=ON \
    -DWITH_EXAMPLE_HEIF_THUMB=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
