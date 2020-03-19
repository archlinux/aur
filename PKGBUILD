# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-root-git
_pkgname=${pkgname%-root-git}
pkgver=299e5f28593bedb8eb84888a2d67d8491afcc8a1
pkgrel=1
pkgdesc="KDE File Manager, patched to be able to run as root, based on dolphin-git sources"
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
source=("git://anongit.kde.org/dolphin.git"
        '0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch' 'Dolphin-Root-Git.desktop')
sha512sums=('SKIP'
            'SKIP'
			'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

pkgver() {
  echo $pkgver
}

prepare() {
  mkdir -p build
  cd dolphin
  git reset --hard $pkgver
  patch -p1 -i $srcdir/0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch
}

build() {
  cd build
  cmake ../dolphin \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  cp ../Dolphin-Root-Git.desktop ${pkgdir}/usr/share/applications
}
