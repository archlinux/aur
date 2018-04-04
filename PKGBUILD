# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.8
_realver=.1
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url="http://www.aseprite.org/"
license=('custom')
depends=('cmark' 'pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp' 'harfbuzz')
makedepends=('cmake')
conflicts=("aseprite-git" "aseprite-gpl")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/Aseprite-v${pkgver}${_realver}-Source.zip"
"${pkgname}.desktop")
sha256sums=(
'20559ea5e0b08361f4d554d885e9e1154eb190b19b6687e0b1243b1589249e56'
'c258fa38a0e0bd575f0bd744c4c3b60cf8d59d596c7572f84bd392e1c5e49b4f'
)

build() {
  cd "$srcdir"

  if [ -z "$ASEPRITE_ACCEPT_EULA" ]; then
    less EULA.txt
    echo "Do you accept the EULA? yes/NO (set ASEPRITE_ACCEPT_EULA=yes to skip this message)"
    read reply
    [ "$reply" == "yes" ] || exit 1
  fi

  mkdir -p build && cd build

  # CMake config notes:
  # Do not build using the shared allegro4. Weird graphical glitches happen
  # when linking to the library from the official repo.  Also, since loadpng.h
  # is also distributed in allegro4, using that shared library must also be
  # disabled since there's no guarantee Arch users might have allegro4
  # installed.


  cmake -DUSE_SHARED_PIXMAN=ON \
    -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_LIBWEBP=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DUSE_SHARED_HARFBUZZ=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_CMARK=ON \
    -DENABLE_UPDATER=OFF \
    -DUSE_SHARED_FREETYPE=ON \
    -DUSE_SHARED_ALLEGRO4=OFF \
    -DUSE_SHARED_LIBLOADPNG=OFF \
    -DCMAKE_INSTALL_PREFIX:STRING=/usr ..

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

  # Remove conflicting files with libarchive
  # TODO: With the current compilation options, looks like aseprite build process builds these binaries. Disable the compilation of the following files later on:
  # Note: Github issue: https://github.com/aseprite/aseprite/issues/1602
  rm -f "$pkgdir/usr/bin/"{bsdcat,bsdcpio,bsdtar,img2webp}
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share/man" "$pkgdir/usr/bin/cmark"
}

# vim:set ts=2 sw=2 et:
