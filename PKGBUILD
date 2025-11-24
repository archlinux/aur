# Maintainer: Abhiram Shibu <abhiramshibu1998@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org> 
# Contributor: Adam Fontenot <fontenot@ucla.edu>
pkgname=libheif-highmem
pkgver=1.20.2
pkgrel=1
pkgdesc='An HEIF and AVIF file format decoder and encoder with 1GB memory and 2000 max items support'
arch=(x86_64)
url='https://github.com/strukturag/libheif'
license=(GPL3)
provides=('libheif' 'libheif.so')
replaces=('libheif')
conflicts=('libheif')
makedepends=(cmake
             dav1d
             ffmpeg
             gdk-pixbuf2
             git
             libjpeg-turbo
             libpng
             rav1e
             svt-av1)

depends=(aom
         gcc-libs
         glibc
         libde265
         libwebp
         x265)
optdepends=('libjpeg-turbo: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc'
            'dav1d: dav1d encoder'
            'ffmpeg: hardware decode'
            'rav1e: rav1e encoder'
            'svt-av1: svt-av1 encoder')
source=(git+https://github.com/strukturag/libheif#tag=v$pkgver)
sha256sums=('ea1b2ca9e88e96941d8122ad82a4068712b16d1ebc84a35a95dd67d2768e5067')

build() {
  # Patch the memory limit
  mv "${srcdir}/libheif" "${srcdir}/${pkgname}"
  sed -i 's/.max_memory_block_size = 512 \* 1024 \* 1024,  \/\/ 512 MB/.max_memory_block_size = 1024 * 1024 * 1024,  \/\/ 1024 MB/' ${srcdir}/${pkgname}/libheif/security_limits.cc
  sed -i 's/.max_items = 1000,/.max_items = 2000,/' ${srcdir}/${pkgname}/libheif/security_limits.cc      
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DAV1D=ON \
    -DWITH_RAV1E=ON \
    -DWITH_FFMPEG_DECODER=ON \
    -DWITH_FFMPEG_DECODER_PLUGIN=ON \
    -DWITH_SvtEnc=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
