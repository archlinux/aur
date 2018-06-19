# Maintainer: Kuba Kowalik <bell@0x07.pl>

pkgname=libresprite
pkgver=1.1.7
pkgrel=1
pkgdesc='fork of last GPL version of aseprite'
arch=('x86_64' 'i686')
url='https://github.com/LibreSprite/LibreSprite'
license=('GPL')
depends=('pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp')
makedepends=('cmake')
source=("git+https://github.com/LibreSprite/LibreSprite.git#tag=v${pkgver}"
        "aseprite.desktop")
sha256sums=('SKIP'
        'd234924baf107e8ede619261814f5debbb1835bd59ffda5e5bf76fe62ce139ab')
conflicts=(aseprite aseprite-git aseprite-gpl)

build() {
  cd "LibreSprite"
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
  cd "LibreSprite"/build

  make DESTDIR="$pkgdir/" install/fast
  install -Dm644 "$srcdir/aseprite.desktop" \
    "$pkgdir/usr/share/applications/aseprite.desktop"
  install -Dm644 "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/aseprite.png"
}

# vim:set ts=2 sw=2 et:
