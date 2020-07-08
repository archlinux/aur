# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.195
pkgrel=3
pkgdesc="Qt based UNIX MAME frontend supporting SDLMAME"
url="https://qmc2.batcom-it.net/"
license=(GPL)
arch=(x86_64)
depends=(qt5-webkit qt5-svg qt5-multimedia qt5-xmlpatterns sdl2 minizip)
makedepends=(rsync)
source=("https://downloads.sourceforge.net/project/qmc2/qmc2/$pkgver/qmc2-$pkgver.tar.bz2"
         qmc2-qt5.15.patch qmc2-types.patch)
sha256sums=('44b36a80ab7cd23e0efc3e0296ea680b38dd122319379bf6a4dcb9c2111183e7'
            '2648c31e12ceebbe10726741a533b9daddf6ecb62d48cbdb154f4a1bdb98082a'
            '8b38ad467bc690102ecf59fdde4604991ccb6e59a43c17860ba1e4d043ed94ee')

prepare() {
  patch -d $pkgname -p1 -i ../qmc2-qt5.15.patch # Fix build with Qt 5.15
  patch -d $pkgname --binary -p1 -i ../qmc2-types.patch # Fix keyword redefinition
}

build() {
  cd $pkgname
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 \
    SYSTEM_MINIZIP=1 SYSTEM_ZLIB=1
}

package() {
  cd $pkgname
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  install -D -m644 "$srcdir/qmc2/data/img/mame.png" "$pkgdir/usr/share/pixmaps"
}
