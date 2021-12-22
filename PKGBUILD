# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: maz-1 <ohmygod19993@gmail.com>

pkgname=qt-heif-image-plugin
pkgver=0.3.3
pkgrel=1
pkgdesc='Qt plugin for HEIF images'
arch=('x86_64')
url='https://github.com/jakar/qt-heif-image-plugin'
license=('LGPL3')
depends=('qt5-base' 'libheif')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jakar/qt-heif-image-plugin/archive/${pkgver}.tar.gz"
        'https://github.com/jakar/qt-heif-image-plugin/pull/18.patch'
        'imagethumbnail-heif.desktop')
sha512sums=('ba617d11e73d73dee5220b668918e313b6d856cabc1567b9221ddb2b3d35c4bfefadcd9e4485bdc7c280be104d09c3580e245d9a8f72c9fac397ebe84fe55e2f'
            '4c81d847515a6e000d6e2dc71b7ab8e8f3670b31aab13f3d8cdb1f6bfeb3f4206a2a6c1e2b666b37cde2cbaaf8c9abfe37f1195ac138d42bfd887dbe64a87642'
            '68b0ad060322b3826ef12affc9615026f812a658227c3ff2ba178fb82683edb9a2286d0a30f15e64fdc241055a10d6732acf6b1f5f1ea5d6a43a31009c7b23d0')

prepare() {
  cd "$pkgname-$pkgver/src"
  # patch from June 2020: "maps color format from HEIF to Qt (i.e. RGB88)"
  patch <"$srcdir/18.patch"
}

build() {
  mkdir -p build-qt5
  cd build-qt5
  cmake "../$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make
}

package() {
  cd build-qt5
  make DESTDIR=$pkgdir install

  install -Dm755 ../imagethumbnail-heif.desktop "${pkgdir}/usr/share/kservices5/imagethumbnail-heif.desktop"
}
