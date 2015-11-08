# Maintainer: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.1.1
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('GPL')
depends=('pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml')
makedepends=('cmake')
source=("git+https://github.com/aseprite/aseprite.git#tag=v${pkgver}"
        "aseprite.desktop")
sha256sums=('SKIP'
        'c9e624b9fd095ebb3eec8220a58d4a9422f39d68477bafcc0047d773814ba0aa')

build() {
  cd "$pkgname"
  mkdir -p build && cd build
  git submodule update --init --recursive
  cmake -DUSE_SHARED_PIXMAN=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_LIBLOADPNG=OFF \
    -DUSE_SHARED_TINYXML=ON \
    -DENABLE_UPDATER=OFF \
    -DCMAKE_INSTALL_PREFIX:STRING=/usr ..
  make aseprite
}

package() {
  cd "$pkgname"/build

  make DESTDIR="$pkgdir/" install/fast
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
