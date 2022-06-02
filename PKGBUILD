# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=trojita
pkgver=0.7
pkgrel=7
pkgdesc='A Qt IMAP email client'
arch=(x86_64)
url='https://trojita.flaska.net'
license=(GPL)
makedepends=(cmake qt5-tools pinentry)
depends=(hicolor-icon-theme qt5-webkit qtkeychain-qt5 qt5-svg qgpgme mimetic)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz{,.asc}
        trojita-gpgme.patch
        trojita-fix-crash.patch::"https://invent.kde.org/pim/trojita/-/commit/cf2364b8.patch"
        trojita-qt5.15.patch::"https://invent.kde.org/pim/trojita/-/commit/2869c385.patch"
        trojita-desktop.patch::"https://invent.kde.org/pim/trojita/-/commit/d080f785.patch"
        trojita-highdpi.patch::"https://invent.kde.org/pim/trojita/-/commit/eecc474a.patch"
        trojita-wayland.patch::"https://invent.kde.org/pim/trojita/-/commit/81e84200.patch")
sha256sums=('e08da881721cafa00ecd772eaef6b99fd37d068cb703eeb532de0ed1ea0136d9'
            'SKIP'
            '9f99bd2d91cd3b345e2bf52c0d9929ea81147f6578b774c5d2b4f2e86aade2a8'
            '3b97c6b60a986ca1ec5f505589600f6ed88a0ddd45960815a64c5f63b7e70d98'
            '7d0a506f16bd0bd112decfb25927fd19d77e53c71ac94e1e06ffddb16381d62e'
            'f7a72c2fa4c8e2bd592a705781a32f6148198f7b43f603e2e0e704b92b38f2c5'
            'a2ebc9ce38e47f8697ca3cbfd17a227dfd0f8c842803978f082857172de5fc42'
            '70646a2d1280f2eb56d166993ea9dee58f31264db9cf7fa1ff9ba469e9d9d73a')
validpgpkeys=('61AB87D6F66CE2FCD2D2E1F56A65DFA844722517')
options=(debug)

prepare() {
  patch -d $pkgname-$pkgver -p1 < trojita-gpgme.patch # suport gmgpe's gpgme++
  patch -d $pkgname-$pkgver -p1 < trojita-fix-crash.patch # Fix crash when opening attachments
  patch -d $pkgname-$pkgver -p1 < trojita-qt5.15.patch # Fix build with Qt 5.15
  patch -d $pkgname-$pkgver -p1 < trojita-desktop.patch # Fix taskbar item on Wayland
  patch -d $pkgname-$pkgver -p1 < trojita-highdpi.patch # Enable high DPI support
  patch -d $pkgname-$pkgver -p1 < trojita-wayland.patch # Fix icon on Wayland
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
