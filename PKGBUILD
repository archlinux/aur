# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.2.0
pkgrel=3
pkgdesc='A visual database applications creator'
arch=(x86_64)
url='https://apps.kde.org/es/kexi-3.3/'
license=(GPL2)
depends=(kdb kreport ktexteditor breeze-icons hicolor-icon-theme)
makedepends=(extra-cmake-modules qt5-tools kdoctools mariadb-libs postgresql qt5-webkit doxygen)
optdepends=('qt5-webkit: Web browser plugin')
source=(https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz{,.sig}
        kexi-qt-5.13.patch::https://invent.kde.org/office/kexi/-/commit/511d99b7.patch
        kexi-glib-2.70.patch::https://invent.kde.org/office/kexi/-/commit/79894e15.patch)
sha256sums=('7a813f9ea815a09c1e733d0e7dc879c64eee85f075389e87e6aab99cf0c1c1ff'
            'SKIP'
            'f4c1bffdc9b057e65e78f890f026c31fec6bf667d3d0c86abcbe4d853ac8c5f6'
            '5c6ae076d366097fa2e90aee5dd14e8cbed76e191cdad39e45fbf78648f00d64')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>
options=(debug)

prepare() {
  patch -d $pkgname-$pkgver -p1 < kexi-qt-5.13.patch # Fix build with Qt 5.13
  patch -d $pkgname-$pkgver -p1 < kexi-glib-2.70.patch # Fix build with glib 2.70
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
