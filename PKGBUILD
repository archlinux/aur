# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=20.08.1
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://community.kde.org/KDEConnect'
arch=(x86_64)
license=(GPL)
groups=(kde-applications kde-network)
depends=(kcmutils kwayland libfakekey qca kpeoplevcard pulseaudio-qt kirigami2 qt5-tools)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz"{,.sig}
         kdeconnect-openssh-8.2.patch)
sha256sums=('8ebfe36b4d08b36881082a3748f63a7c645b51e8f3b094607512817e9f6ce668'
            'SKIP'
            '8bcf0d39dfe059af866f48719562dfe7db7fcb0f20ee75d7adda9784fca0ba64')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  patch -d $pkgname-kde-$pkgver -p1 -i ../kdeconnect-openssh-8.2.patch # Fix file browsing with openssh 8.2
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
