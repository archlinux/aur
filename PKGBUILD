# $Id$
# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=dolphin
pkgname=dolphin-meld
pkgver=18.04.1
pkgrel=2
pkgdesc="KDE File Manager, using Meld rather than Kompare"
arch=(x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails'
            'meld: file comparisons'
            'ruby: installing new service menus from KDE Store' 'kdegraphics-thumbnailers: PDF and PS thumbnails' 'konsole: terminal panel')
groups=(kde-applications kdebase)
source=("https://download.kde.org/stable/applications/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('50db0e6c59383c3141ba96f733d36ac63b8f4d3e1f3d233b4a27da5931179587'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
  cd $_pkgname-$pkgver/src
  sed -i 's/kompare -c/meld/g' dolphinmainwindow.cpp
  sed -i 's/findExecutable(QStringLiteral("kompare")).isEmpty()/findExecutable(QStringLiteral("meld")).isEmpty()/g' dolphinmainwindow.cpp
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
