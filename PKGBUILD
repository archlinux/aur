# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>

pkgbase=qgnomeplatform-git
_pkgname=QGnomePlatform
pkgname=(qgnomeplatform-qt5-git qgnomeplatform-qt6-git)
pkgver=0.7.0.r78.g6505fb8
pkgrel=1
pkgdesc='QPlatformTheme for a better Qt application inclusion in GNOME'
arch=(x86_64)
url='https://github.com/FedoraQt/QGnomePlatform'
license=(LGPL2.1)
makedepends=(cmake git gtk3 qt5-wayland qt6-wayland adwaita-qt5 adwaita-qt6)
source=(git+https://github.com/FedoraQt/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build-qt5 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_qgnomeplatform-qt5-git() {
  pkgdesc='QPlatformTheme for a better Qt5 application inclusion in GNOME'
  depends=(gtk3 qt5-wayland adwaita-qt5)
  replaces=(qgnomeplatform qgnomeplatform-git)
  provides=(qgnomeplatform-qt5)
  conflicts=(qgnomeplatform-qt5)

  DESTDIR="$pkgdir" cmake --install build-qt5
}

package_qgnomeplatform-qt6-git() {
  pkgdesc='QPlatformTheme for a better Qt6 application inclusion in GNOME'
  depends=(gtk3 qt6-wayland adwaita-qt6)
  provides=(qgnomeplatform-qt6)
  conflicts=(qgnomeplatform-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}
