# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=20.04.0
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://community.kde.org/KDEConnect'
arch=(x86_64)
license=(GPL)
groups=(kde-applications kdenetwork)
depends=(hicolor-icon-theme kcmutils kwayland libfakekey qca kpeoplevcard pulseaudio-qt kirigami2)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz"{,.sig}
         kdeconnect-openssh-8.2.patch)
sha256sums=('6ca93ee5e6bbc93b04e58a4327a5c7d434f112fd5fc8c47624e4974ffa09501f'
            'SKIP'
            '8bcf0d39dfe059af866f48719562dfe7db7fcb0f20ee75d7adda9784fca0ba64')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-kde-$pkgver
  patch -p1 -i ../kdeconnect-openssh-8.2.patch # Fix file browsing with openssh 8.2
}

build() {
  cd build
  cmake ../$pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
