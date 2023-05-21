# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.243
pkgrel=3
pkgdesc='Qt based UNIX MAME frontend supporting SDLMAME'
url='https://qmc2.batcom-it.net/'
license=(GPL)
arch=(x86_64)
depends=(qt5-webengine qt5-svg qt5-multimedia qt5-xmlpatterns sdl2 minizip-ng)
makedepends=(rsync)
source=(https://github.com/qmc2/qmc2-mame-fe/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        webengine.patch)
sha256sums=('0608a4e08bc451ae01856b85525f1dc767e01eb823e7e294c772876971e7609b'
            'cd72449743a25fd759bb65d205dd2fd3ba0aaeab618efdae80dddc903e8148dd')

prepare() {
  sed -e 's|PKGCONFIG += minizip|PKGCONFIG += minizip-ng|' -i $pkgname-mame-fe-$pkgver/qmc2.pro
  patch -d $pkgname-mame-fe-$pkgver -p1 < webengine.patch # Port to qtwebengine
}

build() {
  cd $pkgname-mame-fe-$pkgver
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 \
    SYSTEM_MINIZIP=1 SYSTEM_ZLIB=1
}

package() {
  cd $pkgname-mame-fe-$pkgver
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 DESTDIR="$pkgdir" install
  install -Dm644 data/img/mame.png -t "$pkgdir"/usr/share/pixmaps
}
