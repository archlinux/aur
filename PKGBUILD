# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=gens-gs-git
pkgname=('gens-gs-sdl-git' 'gens-gs-qt4-git')
pkgver=r3512.c4e1643
pkgrel=1
pkgdesc='A Sega Genesis/CD/32X emulator'
arch=('i686' 'x86_64')
url='http://segaretro.org/Gens/GS_II'
license=('GPL')
depends_i686=('gcc-libs' 'glew' 'glibc' 'libgl' 'libpng' 'zlib')
depends_x86_64=('lib32-gcc-libs' 'lib32-glew' 'lib32-glibc' 'lib32-libgl'
                'lib32-libpng' 'lib32-zlib')
makedepends=('cmake' 'git' 'nasm' 'python')
makedepends_i686=('popt' 'portaudio' 'qt4' 'sdl2')
makedepends_x86_64=('gcc-multilib' 'lib32-popt' 'lib32-portaudio' 'lib32-qt4'
                    'lib32-sdl2')
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
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_GENS_QT4='TRUE' \
    -DINSTALL_DEBUG='FALSE'
  make
}

package_gens-gs-sdl-git() {
  depends_i686+=('sdl2')
  depends_x86_64+=('lib32-sdl2')
  provides=('gens-gs-sdl')
  conflicts=('gens-gs-sdl')

  cd gens-gs-ii/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 src/gens-sdl/gens-sdl "${pkgdir}"/usr/bin/
}

package_gens-gs-qt4-git() {
  depends_i686+=('portaudio' 'qt4')
  depends_x86_64+=('lib32-portaudio' 'lib32-qt4')
  provides=('gens-gs-qt4')
  conflicts=('gens-gs-qt4')

  cd gens-gs-ii/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 src/gens-qt4/gens-qt4 "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
