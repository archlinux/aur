# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=1.4
pkgrel=2
pkgdesc='Adds communication between KDE and your smartphone'
url='https://community.kde.org/KDEConnect'
license=(GPL)
arch=(x86_64)
depends=(hicolor-icon-theme kcmutils kwayland libfakekey qca kpeoplevcard pulseaudio-qt kirigami2)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration')
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-kde-$pkgver.tar.xz"{,.sig}
         kdeconnect-openssh-8.2.patch)
sha256sums=('caee7945a9d9bb881a943dc8d2fd0d702c04da5bdb2df14d4f875e7cf5d5261a'
            'SKIP'
            '8bcf0d39dfe059af866f48719562dfe7db7fcb0f20ee75d7adda9784fca0ba64')
validpgpkeys=(B3487CA0FF36258E2A2F338BD33E721DF877EFE8  # Albert Vaca Cintora <albertvaka@gmail.com>
              F53223F3337665C2CCEA122E873AC3459BBCF5C0) # Nicolas Fella <nicolas.fella@kdab.com>

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
