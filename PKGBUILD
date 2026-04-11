# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=bluez-qt
pkgname=${_name}5
pkgver=5.116.0
pkgrel=3
pkgdesc='Qt wrapper for Bluez 5 DBus API'
arch=(x86_64)
url='https://invent.kde.org/frameworks/bluez-qt'
license=('LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-scancode-kde-accepted-lgpl')
depends=(qt5-base qt5-declarative bluez)
makedepends=(extra-cmake-modules)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('1bab900d6984f4cbec517354cd6ffb11fd1f50887c5bf711ff4305376e039627'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

latestver() {
  local branch

  branch=$(curl -fsSL "https://download.kde.org/stable/frameworks/" |
    sed -nE 's@.*href="(5\.[0-9]+)/".*@\1@p' |
    sort -V |
    tail -1)

  curl -fsSL "https://download.kde.org/stable/frameworks/${branch}/" |
    sed -nE "s@.*${_name}-([0-9]+\.[0-9]+\.[0-9]+)\.tar\.xz.*@\1@p" |
    sort -Vu |
    tail -1
}

build() {
  cmake -B build -S $_name-$pkgver \
    -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_name-$pkgver/LICENSES/LicenseRef-KDE-Accepted-LGPL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LicenseRef-scancode-kde-accepted-lgpl.txt"
}
