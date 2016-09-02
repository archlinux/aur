# Maintainer: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite-gpl
pkgver=1.1.7
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('GPL')
depends=('pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp')
makedepends=('cmake')
source=("git+https://github.com/aseprite-gpl/aseprite.git#tag=v${pkgver}"
        "aseprite.desktop")
sha256sums=('SKIP'
        '4faeb782805e3427eedb04d7485e3e2d4eac6680509515b521a9f64ef5d79490')
conflicts=(aseprite aseprite-git)

build() {
  cd "aseprite"
  mkdir -p build && cd build
  git submodule update --init --recursive
  cmake -DUSE_SHARED_PIXMAN=ON \
    -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_LIBWEBP=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_LIBLOADPNG=OFF \
    -DUSE_SHARED_TINYXML=ON \
    -DENABLE_UPDATER=OFF \
    -DUSE_SHARED_FREETYPE=ON \
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \
    -DCMAKE_INSTALL_PREFIX:STRING=/usr ..
  make aseprite
}

package() {
  cd "aseprite"/build

  make DESTDIR="$pkgdir/" install/fast
  install -Dm644 "$srcdir/aseprite.desktop" \
    "$pkgdir/usr/share/applications/aseprite.desktop"
  install -Dm644 "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/aseprite.png"
}

# vim:set ts=2 sw=2 et:
