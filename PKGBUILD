# Maintainer: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgbase=qgnomeplatform-solarized
_pkgname=QGnomePlatform
pkgname=(qgnomeplatform-solarized-qt5 qgnomeplatform-solarized-qt6)
pkgver=0.9.0
pkgrel=10
pkgdesc='QPlatformTheme for a better Qt application inclusion in GNOME (solarized)'
arch=(x86_64)
url='https://github.com/FedoraQt/QGnomePlatform'
license=(LGPL2.1)
makedepends=(cmake gtk3 qt5-wayland qt6-wayland adwaita-solarized-qt5 adwaita-solarized-qt6)
source=(https://github.com/FedoraQt/QGnomePlatform/archive/$pkgver/$_pkgname-$pkgver.tar.gz
        https://github.com/FedoraQt/QGnomePlatform/commit/c8000cb1.patch)
sha256sums=('27c0e238a40b56814418a55ee553438e30e2ca5cce02cfb116703452c21dab17'
            '4ffd956df11213fcb31fdd77957e9a024adc35a96efb9631ccc7530f05c0eabf')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < c8000cb1.patch # Fix build with Qt 6.5
}

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

package_qgnomeplatform-solarized-qt5() {
  pkgdesc='QPlatformTheme for a better Qt5 application inclusion in GNOME (solarized)'
  depends=(gtk3 qt5-wayland adwaita-solarized-qt5)
  replaces=(qgnomeplatform)

  DESTDIR="$pkgdir" cmake --install build-qt5
}

package_qgnomeplatform-solarized-qt6() {
  pkgdesc='QPlatformTheme for a better Qt6 application inclusion in GNOME (solarized)'
  depends=(gtk3 qt6-wayland adwaita-solarized-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}
