# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Niklas <dev@n1klas.net>

pkgname=qt6-mqtt
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=3
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1/5.0 for Qt 6"
arch=(x86_64)
url="https://qt-project.org/"
license=(GPL3 custom)
depends=(qt6-base)
makedepends=(cmake git ninja)
source=("git+https://code.qt.io/qt/qtmqtt.git#tag=v$_qtver")
# Skip checksum check for now, since pacman changed how they are generated for
# git repos:
# https://gitlab.archlinux.org/pacman/pacman/-/commit/9548d6cc765b1a8dcf933e8b1b89d0bcc3e50209
# until the new pacman version is available everywhere.
sha256sums=(SKIP)
_pkgfqn=${pkgname/6-/}

build() {
  cmake -B build -S $_pkgfqn \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgfqn/LICENSES/Qt-GPL-exception-1.0.txt \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}
