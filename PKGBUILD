# $Id$
# Maintainer: leaeasy <leaeasy@gmail.com>

pkgname=fbreader-qt5
pkgver=0.99.4
pkgrel=8
pkgdesc="An e-book reader for Linux"
arch=('x86_64')
url="http://www.fbreader.org/"
license=('GPL')
depends=('fribidi' 'bzip2' 'curl' 'qt5-base' 'libunibreak' 'sqlite')
provides=('fbreader')
conflicts=('fbreader')
source=(https://fbreader.org/files/desktop/fbreader-sources-$pkgver.tgz
    "git+https://github.com/lokesh-krishna/FBreader-elementary-theme.git"
    "fbreader-0.99.4.patch"
    "fbreader-narrowing-conversion.patch"
    "qt5.patch")
sha256sums=('3d7c31d5ea314589d2a963290ad16f4d3d631a41e802b8b39f8be0c9f71eb8e9'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir"/fbreader-$pkgver
  patch -Np1 -i "$srcdir"/fbreader-0.99.4.patch
  patch -Np1 -i "$srcdir"/fbreader-narrowing-conversion.patch
  patch -Np1 -i "$srcdir"/qt5.patch
}

build() {
  export UI_TYPE=qt4
  export TARGET_ARCH=desktop
  export TARGET_STATUS=release
  cd "$srcdir"/fbreader-$pkgver
  make ZLSHARED=no
}

package() {
  cd "$srcdir"/fbreader-$pkgver
  make ZLSHARED=no DESTDIR="$pkgdir" install
  find "$srcdir"/FBreader-elementary-theme/FBReader -name "*.png" -exec cp -a {} "$pkgdir"/usr/share/pixmaps/FBReader/ \;
}
