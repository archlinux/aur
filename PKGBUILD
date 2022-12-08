# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-session-ui-git
pkgver=5.6.1.r2.g07800310
pkgrel=1
pkgdesc='Deepin desktop-environment - Session UI module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-session-ui"
license=('GPL3')
groups=('deepin')
depends=('gsettings-qt' 'startdde-git' 'liblightdm-qt5' 'qt5-svg' 'deepin-daemon-git' 'deepin-dock-git' 'deepin-wallpapers-git')
makedepends=('git' 'deepin-gettext-tools-git' 'cmake' 'ninja' 'deepin-dock-git' 'gtest' 'gcovr')
provides=('deepin-notifications' 'deepin-session-ui')
conflicts=('dde-workspace' 'deepin-session-ui' 'deepin-notifications')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-session-ui"
  fix-cmakelist.patch)
sha512sums=('SKIP'
            '50d74d551c71a0039b6064d54939fb8a611941d8e8c653c96a5fc146f3dc168b396d0a4a21c269abb9331fbc7a7cc33909069ea4f8cb20db752705369f1d3710')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|/usr/share/backgrounds/default_background.jpg|/usr/share/backgrounds/deepin/desktop.jpg|' widgets/*.cpp
  patch -p1 -i ../fix-cmakelist.patch
}

build() {
  cd $pkgname
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}
