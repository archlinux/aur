# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=allegro
pkgname=lib32-${_pkgbase}
pkgver=5.0.10
pkgrel=2
pkgdesc='Portable library mainly aimed at video game and multimedia programming (32 bit)'
arch=('x86_64')
url='http://alleg.sourceforge.net/'
license=('custom')
depends=('lib32-jack' 'lib32-libxpm' 'lib32-libxxf86dga' 'lib32-libgl'
         'lib32-physfs' 'lib32-gtk2' 'lib32-libpulse' 'lib32-alsa-lib'
         "$_pkgbase=$pkgver")
makedepends=('cmake' 'gcc-multilib' 'lib32-mesa' 'lib32-glu')
source=("http://downloads.sourceforge.net/alleg/$_pkgbase-$pkgver.tar.gz")
md5sums=('bf51a90e158ff8b1cec0514ef70195cf')
sha256sums=('71b81080f34f6e485edd0c51f22923c18ff967d5db438e591e6f3885d5bdcda1')

build() {
  cd "$srcdir"

  rm -rf build
  mkdir build
  cd build

  cmake "../$_pkgbase-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DWANT_DOCS=OFF \
    -DWANT_PHYSFS=ON \
    -DLIB_SUFFIX="32" \
    -DCMAKE_C_FLAGS="$CFLAGS -m32" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -m32" \
    -DWANT_OPENAL=OFF

  make
}

package() {
  cd "$srcdir"

  make -C build DESTDIR="$pkgdir" install

  # remove header files
  rm -rf "$pkgdir/usr/include"

  # link to license
  install -d "$pkgdir/usr/share/licenses"
  ln -s $_pkgbase "$pkgdir/usr/share/licenses/$pkgname"
}
