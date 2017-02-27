# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-allegro
pkgver=5.2.2
pkgrel=1
pkgdesc='Portable library mainly aimed at video game and multimedia programming (32 bit)'
arch=('x86_64')
url='http://liballeg.org'
license=('custom')
depends=('lib32-jack' 'lib32-libxpm' 'lib32-libxxf86dga' 'lib32-libgl' 'lib32-physfs'
         'lib32-gtk2' 'lib32-libpulse' 'lib32-alsa-lib' 'lib32-libtheora'
         'lib32-opusfile' "${pkgname#*-}")
makedepends=('cmake' 'gcc-multilib' 'lib32-mesa' 'lib32-glu')
source=("http://download.gna.org/allegro/allegro/$pkgver/allegro-$pkgver.tar.gz")
sha256sums=('e285b9e12a7b33488c0e7e139326903b9df10e8fa9adbfcfe2e1105b69ce94fc')

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

  cmake ../${pkgname#*-}-$pkgver.0 \
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
