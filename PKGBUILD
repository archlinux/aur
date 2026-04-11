# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=networkmanager-qt
pkgname=${_name}5
pkgver=5.116.0
pkgrel=3
pkgdesc='Qt wrapper for NetworkManager API'
arch=(x86_64)
url='https://invent.kde.org/frameworks/networkmanager-qt'
license=('LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-scancode-kde-accepted-lgpl')
depends=(networkmanager qt5-base)
makedepends=(extra-cmake-modules)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('0b4e80a4e110776b2f7bcbd4f6371ccbd8d9ed58f01c8a3738ce9c8ef1601b69'
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_name-$pkgver/LICENSES/LicenseRef-KDE-Accepted-LGPL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LicenseRef-scancode-kde-accepted-lgpl.txt"
}
