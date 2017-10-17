# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-allegro
pkgver=5.2.3
_ver=$pkgver.0
pkgrel=1
pkgdesc='Portable library mainly aimed at video game and multimedia programming (32 bit)'
arch=('x86_64')
url='http://liballeg.org'
license=('custom')
depends=('lib32-jack' 'lib32-libxpm' 'lib32-libxxf86dga' 'lib32-libgl' 'lib32-physfs'
         'lib32-gtk2' 'lib32-libpulse' 'lib32-alsa-lib' 'lib32-libtheora'
         'lib32-opusfile' 'lib32-libwebp' "${pkgname#*-}")
makedepends=('cmake' 'gcc-multilib' 'lib32-mesa' 'lib32-glu')
source=("https://github.com/liballeg/allegro5/releases/download/$_ver/allegro-$_ver.tar.gz")
sha256sums=('5a4d40601899492b697ad5cfdf11d8265fe554036a2c912c86a6e6d23001f905')

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

  cmake ../allegro-$_ver \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX="32" -DWANT_PHYSFS=ON -DWANT_OPENAL=OFF \
    -DWANT_DOCS=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  # remove header files
  rm -rf "$pkgdir"/usr/include

  # link to license
  install -d "$pkgdir"/usr/share/licenses
  ln -s allegro "$pkgdir"/usr/share/licenses/$pkgname
}
