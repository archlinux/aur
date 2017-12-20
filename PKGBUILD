# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.6
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url="http://www.aseprite.org/"
license=('custom')
depends=('pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp')
makedepends=('cmake')
conflicts=("aseprite-git" "aseprite-gpl")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/Aseprite-v${pkgver}-Source.zip"
"${pkgname}.desktop")
sha256sums=('e92a9c19cb5d36c64f8ee916ca34f8c2d628beadc58ab75c4718bd99683f8972'
'c258fa38a0e0bd575f0bd744c4c3b60cf8d59d596c7572f84bd392e1c5e49b4f')

build() {
  cd "$srcdir"

  if [ -z "$ASEPRITE_ACCEPT_EULA" ]; then
    less EULA.txt
    echo "Do you accept the EULA? yes/NO (set ASEPRITE_ACCEPT_EULA=yes to skip this message)"
    read reply
    [ "$reply" == "yes" ] || exit 1
  fi

  mkdir -p build && cd build
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
    -DUSE_SHARED_FREETYPE=OFF \
    -DCMAKE_INSTALL_PREFIX:STRING=/usr ..

  # TODO: Note that using the shared freetype library was disabled for aseprite v1.24 due to a missing header
  # Double check if we can use the shared library later on to minimize package size
  #-DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \

  make $MAKEFLAGS
}

package() {
  cd "$srcdir"/build

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "../EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  # WARNING: fix for upstream including gtest and cmark in "make install"
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share/man" "$pkgdir/usr/bin/cmark"

  # Remove conflicting files with libarchive
  # TODO: With the current compilation options, looks like aseprite build process builds these binaries. Disable the compilation of the following files later on:
  rm -f "$pkgdir/usr/bin/"{bsdcat,bsdcpio,bsdtar}
}

# vim:set ts=2 sw=2 et:
