# Maintainer: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.0.9
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('GPL')
depends=('allegro' 'pixman' 'curl' 'giflib' 'zlib' 'libpng' 'tinyxml' 'gtest')
makedepends=('cmake')
source=("git+https://github.com/aseprite/aseprite.git#tag=v${pkgver}"
        "aseprite.desktop")
sha256sums=('SKIP'
        'c9e624b9fd095ebb3eec8220a58d4a9422f39d68477bafcc0047d773814ba0aa')

build() {
  cd "$pkgname"

  cmake -DUSE_SHARED_PIXMAN=ON -DLIBPIXMAN_LIBRARY=/usr/lib/libpixman-1.so -DLIBPIXMAN_INCLUDE_DIR=/usr/include/pixman-1/ \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_JPEGLIB=OFF \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=OFF \
    -DUSE_SHARED_LIBLOADPNG=OFF \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_GTEST=ON \
    -DENABLE_UPDATER=OFF \
    -DCMAKE_INSTALL_PREFIX:STRING=/usr .
  make aseprite
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install/fast
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
