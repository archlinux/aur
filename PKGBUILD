# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-root
_pkgname=${pkgname%-root}
pkgver=19.04.2
pkgrel=1
pkgdesc="KDE File Manager, patched to be able to run as root"
arch=(armv7h i686 x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit phonon-qt5)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kde-thumbnailer-odf: ODF thumbnails'
            'ruby: installing new service menus from KDE Store' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu')
conflicts=($_pkgname)
provides=($_pkgname)
source=("https://download.kde.org/stable/applications/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig}
        0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch)
sha512sums=('e1480c2f98f06a29048683180e1ab30992e57a4cefde1b3a1a0da1c1c654482cc2e57d23fb7a7b8102e76f86c2b09b09900d37dbddc753c85f545146d47c5574'
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
