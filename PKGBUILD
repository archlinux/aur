# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.243
pkgrel=7
pkgdesc='Qt based UNIX MAME frontend supporting SDLMAME'
url='https://github.com/qmc2/qmc2-mame-fe'
license=(GPL-2.0-only)
arch=(x86_64)
depends=(gcc-libs
         glibc
         minizip-ng
         qt5-base
         qt5-multimedia
         qt5-svg
         qt5-webengine
         qt5-xmlpatterns
         sdl2
         zlib)
makedepends=(git
             rsync)
source=(git+https://github.com/qmc2/qmc2-mame-fe#tag=v$pkgver
        webengine.patch)
sha256sums=('359d4e4d224b760c2fcaa3d9719c6c4d7da86e34dd3a99b5b6d5f104164dac2e'
            'cd72449743a25fd759bb65d205dd2fd3ba0aaeab618efdae80dddc903e8148dd')

prepare() {
  sed -e 's|PKGCONFIG += minizip|PKGCONFIG += minizip-ng|' -i $pkgname-mame-fe/qmc2.pro
  patch -d $pkgname-mame-fe -p1 < webengine.patch # Port to qtwebengine
}

build() {
  cd $pkgname-mame-fe
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 \
    SYSTEM_MINIZIP=1 SYSTEM_ZLIB=1
}

package() {
  cd $pkgname-mame-fe
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 DESTDIR="$pkgdir" install
  install -Dm644 data/img/mame.png -t "$pkgdir"/usr/share/pixmaps
}
