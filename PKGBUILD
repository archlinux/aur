# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt5-git
pkgver=0.9.15.r3257.8b1b7685
pkgrel=1
pkgdesc="A Sega Saturn emulator. Qt5 port (GIT version)"
arch=('x86_64' 'i386')
url='http://yabause.org'
license=('GPL')
depends=('mini18n-git'
         'openal'
         'sdl2'
         'glew'
         'freeglut'
         'libxkbcommon-x11'
         'qt5-multimedia'
         'libsm'
         )
makedepends=('git'
             'cmake'
             'glu'
             'doxygen'
             )
conflicts=('yabause-qt' 'yabause-qt5' 'yabause-gtk' 'yabause')
provides=('yabause-qt5')
source=('git+https://github.com/Yabause/yabause.git'
        'rwx.patch'
        )
sha256sums=('SKIP'
            'd29997d3249683081a2687f31e777f917093101d56815d22103aaaf22ac786b1'
            )

pkgver() {
  cd yabause/yabause
  _ver="$(cat CMakeLists.txt | grep -m3 "YAB_VERSION" | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd yabause/yabause
  patch -Np1 -i "${srcdir}/rwx.patch"

  # Install .svg icon instead .png
  cp src/logo.svg src/qt/resources/icons/yabause.svg
  sed 's|yabause.png|yabause.svg|g' -i src/qt/CMakeLists.txt
}

build() {
  cd build

  cmake ../yabause/yabause \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAB_PORTS=qt \
    -DYAB_NETWORK=ON \
    -DYAB_OPTIMIZED_DMA=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
