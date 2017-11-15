# Maintainer:
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.187
pkgrel=1
pkgdesc="Qt based UNIX MAME frontend supporting SDLMAME"
url="http://qmc2.batcom-it.net/"
license=(GPL)
arch=(x86_64)
depends=(qt5-webkit qt5-svg qt5-multimedia sdl2 minizip)
makedepends=(rsync)
source=("http://downloads.sourceforge.net/project/qmc2/qmc2/$pkgver/qmc2-$pkgver.tar.bz2" qmc2-qt5.9.patch)
sha256sums=('8db7e4e8fb22b40c65869e70f8517c6897e20bcf2c78026b09a443a8c4459092'
            '2eadfc85654bd7a3908e6e9d12f509a735d2fb359f299f07f367f1fc9602c7e0')

prepare() {
  cd $pkgname
  patch -p2 -i ../qmc2-qt5.9.patch # Fix build with Qt 5.9
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
