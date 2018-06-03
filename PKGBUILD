# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite-git
name=aseprite
pkgver=1.2.8.r42.g594fe3fb9
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('custom')
depends=('cmark' 'curl' 'freetype2' 'giflib' 'harfbuzz' 'libjpeg-turbo' 'libpng' 'libwebp' 'pixman' 'tinyxml' 'zlib')
makedepends=('cmake' 'ninja')
conflicts=('aseprite' 'aseprite-gpl')
source=("git+https://github.com/aseprite/aseprite.git"
        "aseprite.desktop")
sha256sums=('SKIP'
            '4faeb782805e3427eedb04d7485e3e2d4eac6680509515b521a9f64ef5d79490')

pkgver() {
    cd "$name"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "${name}"

  less EULA.txt
  echo "Do you accept the EULA? yes/NO"
  read reply
  [ "$reply" == "yes" ] || exit 1

  git submodule update --init --recursive
  mkdir -p build
}

build() {
  cd "${name}/build"

  cmake -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_CMARK=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_FREETYPE=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_HARFBUZZ=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_LIBLOADPNG=OFF \
    -DUSE_SHARED_LIBWEBP=ON \
    -DUSE_SHARED_PIXMAN=ON \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DENABLE_UPDATER=OFF \
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \
    -DCMAKE_INSTALL_PREFIX:STRING=/usr \
    -G Ninja ..
  ninja aseprite
}

package() {
  cd "${name}"/build

  DESTDIR="${pkgdir}" ninja install
  install -Dm644 "$srcdir/$name.desktop" \
    "$pkgdir/usr/share/applications/$name.desktop"
  install -Dm644 "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/$name.png"
  install -Dm644 "../EULA.txt" "$pkgdir/usr/share/licenses/$name/EULA.txt"

  # Remove stuff belonging to libarchive (no cmake flag)
  rm ${pkgdir}/usr/bin/bsd*
  rm ${pkgdir}/usr/lib/pkgconfig/libarchive.pc

  # Remove stuff belonging to libwebp (cmake flag in place, still installed)
  rm ${pkgdir}/usr/bin/img2webp
  rm -r ${pkgdir}/usr/include/webp/
  rm ${pkgdir}/usr/lib/libwebp*
  rm -r ${pkgdir}/usr/share/WebP/
}

# vim:set ts=2 sw=2 et:
