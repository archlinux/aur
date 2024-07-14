# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgbase=qgnomeplatform
_pkgname=QGnomePlatform
pkgname=(qgnomeplatform-qt5 qgnomeplatform-qt6 adwaita-color-schemes)
pkgver=0.9.2
pkgrel=1
pkgdesc='QPlatformTheme for a better Qt application inclusion in GNOME'
arch=(x86_64)
url='https://github.com/FedoraQt/QGnomePlatform'
license=(LGPL2.1)
makedepends=(cmake gtk3 qt5-wayland qt5-quickcontrols2 qt6-wayland adwaita-qt5 adwaita-qt6)
source=(https://github.com/FedoraQt/QGnomePlatform/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('9446c0d68faccdd0e44039b2089ab4524939a47cfe8c34e50b0368c2b58a5552')

build() {
  cmake -B build-qt5 -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_qgnomeplatform-qt5() {
  pkgdesc='QPlatformTheme for a better Qt5 application inclusion in GNOME'
  depends=(gtk3 qt5-wayland qt5-quickcontrols2 adwaita-qt5 adwaita-color-schemes)
  optdepends=('qqc2-desktop-style: For styling QtQuick applications')
  provides=(qgnomeplatform)
  conflicts=(qgnomeplatform)

  DESTDIR="$pkgdir" cmake --install build-qt5
  rm -r "$pkgdir"/usr/share
}

package_qgnomeplatform-qt6() {
  pkgdesc='QPlatformTheme for a better Qt6 application inclusion in GNOME'
  depends=(gtk3 qt6-wayland adwaita-qt6 adwaita-color-schemes)

  DESTDIR="$pkgdir" cmake --install build-qt6
  rm -r "$pkgdir"/usr/share
}

package_adwaita-color-schemes() {
  pkgdesc='Adwaita color schemes for KDE applications'

  DESTDIR="$pkgdir" cmake --install build-qt5/src/color-schemes
}
