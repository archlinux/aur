# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=allegro4
pkgname=lib32-$_pkgbase
pkgver=4.4.2
pkgrel=3
pkgdesc="Portable library mainly aimed at video game and multimedia programming (legacy version)"
arch=('i686' 'x86_64')
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('lib32-jack' 'lib32-libxpm' 'lib32-libxxf86vm' 'lib32-libxxf86dga'
         'lib32-libxcursor' 'lib32-alsa-lib' 'lib32-libogg' "$_pkgbase=$pkgver")
makedepends=('cmake' 'lib32-libpng' 'lib32-mesa' 'gcc-multilib')
options=('staticlibs')
source=("http://downloads.sourceforge.net/alleg/allegro-$pkgver.tar.gz")
md5sums=('4db71b0460fc99926ae91d223199c2e6')
sha256sums=('1b21e7577dbfada02d85ca4510bd22fedaa6ce76fde7f4838c7c1276eb840fdc')

build() {
  cd "$srcdir"

  rm -rf build
  mkdir build
  cd build

  cmake "../allegro-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DWANT_DOCS=OFF \
    -DWANT_TOOLS=OFF \
    -DWANT_EXAMPLES=OFF \
    -DWANT_TESTS=OFF \
    -DLIB_SUFFIX="32" \
    -DCMAKE_C_FLAGS="$CFLAGS -m32" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -m32"

  make
}

package() {
  cd "$srcdir"

  make -C build DESTDIR="$pkgdir" install

  # remove header files
  rm -rf "$pkgdir/usr/include"

  # rename allegro-config
  mv "$pkgdir/usr/bin/allegro-config"{,-32}

  # link to license
  install -d "$pkgdir/usr/share/licenses/"
  ln -s $_pkgbase "$pkgdir/usr/share/licenses/$pkgname"
}
