# $Id: PKGBUILD 196458 2016-11-21 14:42:59Z anthraxx $
# Maintainer: Kye W. Shi <shi dot kye at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian at liem dot se>

pkgname=slock-gruvbox
pkgver=1.4
pkgrel=2
pkgdesc="A simple screen locker for X"
arch=('any')
url="http://tools.suckless.org/slock"
license=('MIT')
depends=('libxext' 'libxrandr')
conflicts=('slock' 'slock-git' 'slock-extra-git' 'slockd')
provides=('slock')
source=("http://dl.suckless.org/tools/slock-$pkgver.tar.gz" 'gruvbox.patch')
#source=("slock-$pkgver.tar.bz2::http://hg.suckless.org/slock/archive/$_pkgver.tar.gz")
md5sums=('f91dd5ba50ce7bd1842caeca067086a3'
         'dcc568535e4dbffda9e807a01e47f65f')

prepare() {
  cd "$srcdir/slock-$pkgver"
  patch -Np1 -i "${srcdir}/gruvbox.patch"
  sed -i 's|static const char \*group = "nogroup";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
}

build() {
  cd "$srcdir/slock-$pkgver"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/slock-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
