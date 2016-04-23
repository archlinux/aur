# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-allegro
pkgver=5.2.0.0
pkgrel=1
pkgdesc='Portable library mainly aimed at video game and multimedia programming (32 bit)'
arch=('x86_64')
url='http://liballeg.org'
license=('custom')
depends=('lib32-jack' 'lib32-libxpm' 'lib32-libxxf86dga' 'lib32-libgl' 'lib32-physfs'
         'lib32-gtk2' 'lib32-libpulse' 'lib32-alsa-lib' 'lib32-libtheora'
         "${pkgname#*-}")
makedepends=('cmake' 'gcc-multilib' 'lib32-mesa' 'lib32-glu')
source=("http://download.gna.org/allegro/allegro/${pkgver%.*}/allegro-${pkgver%.*}.tar.gz")
sha256sums=('af5a69cd423d05189e92952633f9c0dd0ff3a061d91fbce62fb32c4bd87f9fd7')

prepare() {
  # reset build folder
  rm -rf build
  mkdir build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build

  cmake ../${pkgname#*-}-$pkgver \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX="32" -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DWANT_PHYSFS=ON -DWANT_OPENAL=OFF \
    -DWANT_DOCS=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF
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
