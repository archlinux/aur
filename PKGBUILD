# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt5-svn
pkgver=0.9.14.3265
pkgrel=1
pkgdesc="A Sega Saturn emulator. Qt5 port (SVN version)"
arch=('x86_64' 'i386')
url="http://yabause.org/"
license=('GPL')
depends=('mini18n-git' 'openal' 'sdl2' 'freeglut' 'qt5-base' 'libxkbcommon-x11' 'libsm')
makedepends=('subversion' 'cmake' 'glu' 'doxygen')
conflicts=('yabause-qt' 'yabause-qt5' 'yabause-gtk' 'yabause')
provides=('yabause-qt5')
source=("svn+https://svn.code.sf.net/p/yabause/code/trunk/yabause/"
        'rwx.patch')
_svnmodule="yabause"
sha1sums=('SKIP'
          '749276456a137ab913c631b9c61d113d7b67c854')

pkgver() {
  cd yabause
  _major_v="$(grep -e "YAB_VERSION_MAJOR" CMakeLists.txt -num1 | tr -d ')' | cut -d ' ' -f2)"
  _minor_v="$(grep -e "YAB_VERSION_MINOR" CMakeLists.txt -num1 | tr -d ')' | cut -d ' ' -f2)"
  _patch_v="$(grep -e "YAB_VERSION_PATCH" CMakeLists.txt -num1 | tr -d ')' | cut -d ' ' -f2)"
  echo "$(echo -n ${_major_v}.${_minor_v}.${_patch_v}).$(svnversion)"
}

prepare() {
  mkdir -p build
  cd yabause
  patch -Np1 -i ../rwx.patch
}

build() {
  cd build

  cmake ../yabause \
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
