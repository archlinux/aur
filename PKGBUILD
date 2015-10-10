# Maintainer: Jamie Christian <itschristian at gmail dot com>
_pkgname=RespeQt
pkgname=respeqt-git
pkgver=r2.r9.gcdde594
pkgrel=2
pkgdesc="RespeQt emulates Atari SIO peripherals when connected to an Atari 8-bit computer with an SIO2PC cable."
url="https://github.com/jzatarski/RespeQt"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('zlib' 'qt5-base' 'glibc' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools')
source=("$_pkgname::git+https://github.com/jzatarski/RespeQt")
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