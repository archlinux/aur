# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=22.04.0
pkgrel=2
pkgdesc='Adds communication between KDE and your smartphone'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL)
groups=(kde-applications kde-network)
depends=(kcmutils kwayland libfakekey qca-qt5 kpeoplevcard pulseaudio-qt qqc2-desktop-style hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'qt5-tools: for some runcommand plugin actions')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/network/kdeconnect-kde/-/commit/21dbf041.patch)
sha256sums=('9b2137a2c5540448ac3af7176f30da3c6e790ea217924de7ce685a5a3450ff9f'
            'SKIP'
            'ecb7fb9ad26606a91436353fc008bede20998c5a0d58fca35b14f115f4c7924c')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug)

prepare() {
  patch -d $pkgname-kde-$pkgver -p1 < 21dbf041.patch # Fix crash in settings
}

build() {
  cmake -B build -S $pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
