# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gens-gs-ii-git
pkgver=r2642.8454ae5
pkgrel=1
pkgdesc='A Sega Genesis/CD/32X emulator'
arch=('i686' 'x86_64')
url='http://segaretro.org/Gens/GS_II'
license=('GPL')
depends_i686=('glew' 'minizip' 'portaudio' 'qt4')
depends_x86_64=('lib32-glew' 'lib32-portaudio' 'lib32-qt4')
makedepends=('cmake' 'git' 'nasm' 'python')
makedepends_x86_64=('gcc-multilib')
conflicts=('gens-gs' 'gens-gs-ii')
source=('git+git://dusers.drexel.edu/srv/git/~korth/gens-gs-ii.git')
sha256sums=('SKIP')

pkgver() {
  cd gens-gs-ii

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd gens-gs-ii

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  if [[ $CARCH == x86_64 ]]; then
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  fi

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd gens-gs-ii/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 src/gens-qt4/gens-qt4 "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
