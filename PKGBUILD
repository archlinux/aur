# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-qt5platform-plugins-git
pkgver=5.6.21.r1.gf3a7223
pkgrel=1
pkgdesc='Qt platform plugins for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/qt5platform-plugins"
license=('GPL3')
provides=('deepin-qt5platform-plugins')
conflicts=('deepin-qt5platform-plugins')
depends=('cairo' 'dwayland' 'qt5-wayland' 'qt5-x11extras')
makedepends=('git' 'expac' 'qt5-xcb-private-headers' 'libglvnd' 'libxcb')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/qt5platform-plugins")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  rm -r xcb/libqt5xcbqpa-dev wayland/qtwayland-dev
  sed -i '/find_package/i find_package(ECM REQUIRED 1.0.0)\nset(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${CMAKE_MODULE_PATH})' wayland/wayland-shell/wayland-shell.cmake
  sed -i 's|qt${QT_VERSION_MAJOR}/plugins|qt/plugins|' xcb/CMakeLists.txt wayland/*/CMakeLists.txt 
}

build() {
  cd $pkgname
  cmake . -GNinja \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_XCB_PRIVATE_HEADERS=/usr/include/qtxcb-private
  cmake --build .
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
