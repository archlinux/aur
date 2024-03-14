# Maintainer: Jamie Christian <itschristian at gmail dot com>

_pkgname=RespeQt
pkgbase=respeqt-git
pkgname=respeqt-git
pkgver=r5.4RC3.r2.g48bdc24
pkgrel=1
pkgdesc="RespeQt emulates Atari SIO peripherals when connected to an Atari 8-bit computer with an SIO2PC cable."
url="https://github.com/josch1710/RespeQt"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-only')
depends=('zlib' 'qt5-base' 'glibc' 'hicolor-icon-theme' 'qt5-serialport' 'qt5-svg' 'libcups')
makedepends=('git' 'qt5-tools' 'cmake' 'debugedit')
source=("$_pkgname::git+https://github.com/josch1710/RespeQt")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  install -d build
  cd build
  cmake ..
  make
}

package() {
  # Move program to /usr/bin/.
  cd $_pkgname
  install -Dm755 build/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  # Create and move the launcher.
  printf "[Desktop Entry]\nVersion=1.0.1.Preview_1\nType=Application\nName=RespeQt\nGenericName=RespeQt\nComment=RespeQt emulates Atari SIO peripherals when connected to an Atari 8-bit computer with an SIO2PC cable.\nTryExec=RespeQt\nExec=RespeQt\nIcon=/usr/share/icons/hicolor/apps/RespeQt.png\nCategories=Application;Game;\nTerminal=false\nMimeType=application/x-respeqt;" > RespeQt.desktop
  install -Dm644 RespeQt.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Get icon size and then move the icon to folder named after it's size.
  cd ./resources/main-icon
  install -Dm644 RespeQt.png "$pkgdir/usr/share/icons/hicolor/apps/$_pkgname.png"
}
