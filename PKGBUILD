# Maintainer: Samisafool <thenerdiestguy@gmail.com>
# Contributor: Dan Johansen <strit@manjaro.org>

_pkgname=login1
pkgbase=dfl-login1-git
pkgname=('dfl-login1-git' 'dfl-login1-qt6-git')
pkgver=0.1.1
pkgrel=1
pkgdesc="Implementation of systemd/elogind for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('git' 'meson' 'ninja' 'qt5-base' 'qt6-base')
source=("login1::git+https://gitlab.com/desktop-frameworks/login1.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-login1-git() {
  depends=('qt5-base')
  conflicts=('dfl-login1')
  provides=('dfl-login1')
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-login1-qt6-git() {
  depends=('qt6-base')
  conflicts=('dfl-login1-qt6')
  provides=('dfl-login1-qt6')
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
