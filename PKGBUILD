# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-root
_pkgname=${pkgname%-root}
pkgver=19.12.2
pkgrel=1
pkgdesc="KDE File Manager, patched to be able to run as root"
arch=(armv7h i686 x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit phonon-qt5)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu')
conflicts=($_pkgname)
provides=($_pkgname)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig}
        0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch)
sha512sums=('c9b43a3e923e6f261225ab7ebc0a35722f4aba197015e48739c7b0cc442dfa227875b55e85a28c8703abdfab7b592432d14ca3560155e59ad39a4542345646dc'
            'SKIP'
            '01fb828b6383250df76d71923a49ed79e54599a6b3b28428aeb94466c7a442a2e03642fffa6387f2d456b2a39149e6d38269a94fb76d07e3e02d8aa56a358f0e')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 -i $srcdir/0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
