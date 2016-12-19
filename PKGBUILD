# Maintainer: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.1.11
pkgrel=2
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('custom')
depends=('pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp')
makedepends=('cmake')
conflicts=('aseprite-git' 'aseprite-gpl')
source=("git+https://github.com/aseprite/aseprite.git#tag=v${pkgver}"
        "aseprite.desktop")
sha256sums=('SKIP'
        '4faeb782805e3427eedb04d7485e3e2d4eac6680509515b521a9f64ef5d79490')

build() {
  cd "$pkgname"

  if [ -z "$ASEPRITE_ACCEPT_EULA" ]; then
    less EULA.txt
    echo "Do you accept the EULA? yes/NO (set ASEPRITE_ACCEPT_EULA=yes to skip this message)"
    read reply
    [ "$reply" == "yes" ] || exit 1
  fi

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
  make 
}

package() {
  cd "$pkgname"/build

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "../EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  # WARNING: fix for upstream including gtest and cmark in "make install"
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share/man" "$pkgdir/usr/bin/cmark"
}

# vim:set ts=2 sw=2 et:
