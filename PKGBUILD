# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=fi
_pkgname=f-irc
arch=('i686' 'x86_64')
pkgver=1.36
pkgrel=2
pkgdesc="f-irc is an irc terminal client"
license=('GPL-2.0-only')
depends=('ncurses')
url="https://web.archive.org/web/20181207164751/https://vanheusden.com/f-irc/"
source=("http://deb.debian.org/debian/pool/main/f/f-irc/f-irc_${pkgver}.orig.tar.gz"
        "fix_ftbfs.patch"
        "format-security.patch")
sha256sums=('b5fad4383ab905ec5ca5865325e72a4b2c8f0e7c08d3bb8e7419aad12d9a6dc7'
            'e166168a733bcd909b672f5e47a1bda59e391ebb4f4fca588c78a702ed1ca7fd'
            'e358f051cb1cd895b6b8ba0d821aa8ccedce73295d4a663aca72d47b007ad1da')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fix_ftbfs.patch"
  patch -p1 -i "$srcdir/format-security.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/include/s%ncursesw/%%' *.c *.h
  # old K&R-style code, fails with GCC >= 14 defaults
  CFLAGS+=" -std=gnu17 -Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
  make DESTDIR= SYSCONFDIR=/etc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
  install -Dm644 firc.ignore "$pkgdir/etc/firc.ignore"
}
