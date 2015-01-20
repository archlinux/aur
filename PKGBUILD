# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-allegro
pkgver=5.0.11
pkgrel=1
pkgdesc='Portable library mainly aimed at video game and multimedia programming (32 bit)'
arch=('x86_64')
url='http://alleg.sourceforge.net/'
license=('custom')
depends=('lib32-jack' 'lib32-libxpm' 'lib32-libxxf86dga' 'lib32-libgl'
         'lib32-physfs' 'lib32-gtk2' 'lib32-libpulse' 'lib32-alsa-lib'
         "${pkgname#*-}=$pkgver")
makedepends=('cmake' 'gcc-multilib' 'lib32-mesa' 'lib32-glu')
source=("http://downloads.sourceforge.net/alleg/${pkgname#*-}-$pkgver.tar.gz")
sha256sums=('49fe14c9571463ba08db4ff778d1fbb15e49f9c33bdada3ac8599e04330ea531')

prepare() {
  # reset build folder
  rm -rf build
  mkdir build
}

build() {
  cd build

  cmake ../${pkgname#*-}-$pkgver \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_DOCS=OFF -DWANT_PHYSFS=ON -DWANT_OPENAL=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF \
    -DLIB_SUFFIX="32" -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DCMAKE_C_FLAGS="$CFLAGS -m32" -DCMAKE_CXX_FLAGS="$CXXFLAGS -m32"
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  # remove header files
  rm -rf "$pkgdir"/usr/include

  # link to license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname
}
