# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt
pkgver=0.9.15
pkgrel=2
pkgdesc='A Sega Saturn emulator'
arch=('x86_64')
url="http://yabause.org/"
license=('GPL')
depends=('freeglut' 'glew' 'openal' 'qt5-base' 'qt5-multimedia' 'sdl2')
makedepends=('cmake' 'glu' 'libxmu')
conflicts=('yabause-gtk')
source=("https://download.tuxfamily.org/yabause/releases/${pkgver}/yabause-${pkgver}.tar.gz"
        'rwx.patch')
sha256sums=('4334c43fe0f3ff297bac8e91f4e059fe5fd276291faff2489e37b5b3a4ccc2b2'
            'd29997d3249683081a2687f31e777f917093101d56815d22103aaaf22ac786b1')

prepare() {
  cd yabause-${pkgver}

  patch -Np1 -i ../rwx.patch
}

build() {
  cd yabause-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DYAB_PORTS='qt' \
    -DYAB_NETWORK='ON' \
    -DYAB_OPTIMIZED_DMA='ON' \
    -DSH2_DYNAREC=OFF    # https://github.com/Yabause/yabause/issues/270
  make
}

package() {
  cd yabause-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
