# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt5-git
pkgver=0.9.15.r3231.ee28cc7
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
sha1sums=('SKIP'
          '749276456a137ab913c631b9c61d113d7b67c854'
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
