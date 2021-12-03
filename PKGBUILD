# Maintainer: Jamie Christian <itschristian at gmail dot com>

_pkgname=RespeQt
pkgbase=respeqt-git
pkgname=respeqt-git
pkgver=r5.3.r16.gc7489af
pkgrel=1
pkgdesc="RespeQt emulates Atari SIO peripherals when connected to an Atari 8-bit computer with an SIO2PC cable."
url="https://github.com/RespeQt/RespeQt"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
depends=('zlib' 'qt5-base' 'glibc' 'hicolor-icon-theme' 'qt5-serialport' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=("$_pkgname::git+https://github.com/RespeQt/RespeQt")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  install -d build
  cd build
  qmake-qt5 ..
  make
}

package() {
  # Move program to /user/bin/.
  cd $_pkgname
  install -Dm755 build/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  # Create and move the launcher.
  printf "[Desktop Entry]\nVersion=1.0.1.Preview_1\nType=Application\nName=RespeQt\nGenericName=RespeQt\nComment=RespeQt emulates Atari SIO peripherals when connected to an Atari 8-bit computer with an SIO2PC cable.\nTryExec=RespeQt\nExec=RespeQt\nIcon=/usr/share/icons/hicolor/49x48/apps/RespeQt.png\nCategories=Application;Game;\nTerminal=false\nMimeType=application/x-respeqt;" > RespeQt.desktop
  install -Dm644 RespeQt.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Get icon size and then move the icon to folder named after it's size.
  cd ./main-icon
  _size=$(file RespeQt.png | cut -f 5 -d " ")$(file RespeQt.png | cut -f 6 -d " ")$(file RespeQt.png | cut -f 7 -d " " | tr -d '[:punct:]')
  install -Dm644 RespeQt.png "$pkgdir/usr/share/icons/hicolor/$_size/apps/$_pkgname.png"
}
