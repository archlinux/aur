# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=dolphin
pkgname=dolphin-root
pkgver=17.04.2
pkgrel=1
pkgdesc="File Manager, patched to be able to run as root"
arch=('armv7h' 'i686' 'x86_64')
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kuiserver kcmutils)
makedepends=(extra-cmake-modules kdoctools python)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 
            'ruby: installing new service menus from KDE Store' 'kdegraphics-thumbnailers: PDF and PS thumbnails' 'konsole: terminal panel')
conflicts=('kdebase-dolphin<15.08' 'dolphin')
replaces=(kdebase-dolphin dolphin)
source=("https://download.kde.org/stable/applications/$pkgver/src/${_pkgname}-$pkgver.tar.xz"{,.sig}
        "https://gitlab.com/Megver83/kdebase-root-patches/raw/master/0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch"{,.sig})
sha256sums=('45ac5454ec6f2e1382ab250be16871a3184804b91f23839a7ec4d8f4b972a0f9'
            'SKIP'
            'a82476fd2b95aab513e7d80fd50b62a361167b9847584a530570bf84758bd76c'
            'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
              '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
) 

prepare() {
  mkdir -p build
  cd $srcdir/${_pkgname}-$pkgver
  patch -p1 -i $srcdir/0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch
}

build() {
  cd build
  cmake ../${_pkgname}-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
