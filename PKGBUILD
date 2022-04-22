# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.1.0
pkgrel=3
pkgdesc='A note taking application for KDE'
url='https://www.kde.org/applications/utilities/kjots/'
arch=(x86_64)
license=(GPL)
depends=(kontactinterface akonadi akonadi-notes kpimtextedit grantlee)
makedepends=(extra-cmake-modules kdoctools)
source=(https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz
        kjots-deps.patch
        https://invent.kde.org/pim/kjots/-/commit/3d3cee8c.patch
        https://invent.kde.org/pim/kjots/-/commit/581548a1.patch
        https://invent.kde.org/pim/kjots/-/commit/b9d91006.patch
        https://invent.kde.org/pim/kjots/-/commit/17f373bb.patch)
sha256sums=('0cee6238410ef4ae6ec66dc45a1499d8db92801122e4d7906060ce4623e812be'
            'ce40361c97011c4ea7e984c403b7196d307eb552e05b36b54356600bca885f1a'
            '2f4ccaa9f8d98ea642ca5091bb4f863643729ad4a16133d0840fadfcc2232495'
            'cbc9ee94ffba826a4aec4e09ff8c28eca5ffb1945249c6752598384bba4e84cd'
            'c5cb52e33e46da5d5360fdbd35d188bf73641931bdf26d238279109da74aa587'
            '89d8cb5b166d8a3f78eb7b443234e0319868ad80f5005e589c33c5b2b0b9e58c')

prepare() {
  patch -d $pkgname-$pkgver -p1 < kjots-deps.patch # Remove unused dependencies
  patch -d $pkgname-$pkgver -p1 < 3d3cee8c.patch # Fix build with akonadi 21.12
  patch -d $pkgname-$pkgver -p1 < 581548a1.patch
  patch -d $pkgname-$pkgver -p1 < b9d91006.patch # Fix build with akonadi 22.04
  patch -d $pkgname-$pkgver -p1 < 17f373bb.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF 
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
