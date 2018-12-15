# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=slock-plus
_pkgname=slock
pkgver=1.4
pkgrel=1
pkgdesc="A simple screen locker for X, with patches: control clear, message, terminalkeys, quickcancel"
arch=('x86_64')
url="http://tools.suckless.org/slock"
license=('MIT')
depends=('libxext' 'libxrandr')
provides=('slock')
conflicts=('slock')
source=("https://git.sr.ht/~craftyguy/${_pkgname}/archive/${pkgver}-plus.tar.gz")
sha256sums=('64a94798cb5233ccd9e747b43b08316d38bcf33a542276d016a996343423606d')

prepare() {
  cd "$srcdir/slock-$pkgver-plus"
  sed -i 's|static const char \*group = "nogroup";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
}

build() {
  cd "$srcdir/slock-$pkgver-plus"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/slock-$pkgver-plus"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
