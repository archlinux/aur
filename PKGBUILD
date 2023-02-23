# Maintainer sgerwk <sgerwk at aol dot com>
_pkgname=felinks
pkgname=${_pkgname}-python
pkgver=0.16.0
pkgrel=1
pkgdesc="the elinks text browser, with Python support"
license=(GPL2)
arch=('x86_64' 'i686')
depends=(tre brotli libx11 openssl gpm zstd libidn expat ncurses lua51 python3)
makedepends=(gcc make)
conflicts=(elinks elinks-git felinks)
url="http://github.com/rkd77/felinks"
source=(git+https://github.com/rkd77/felinks#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd $startdir/src/${_pkgname}
  ./autogen.sh
  LDFLAGS="$(echo "$LDFLAGS" | sed 's/,--as-needed//')"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
  --with-python --with-luapkg=lua51 --enable-cgi --enable-leds \
  --enable-bittorrent
  sed 's/,--as-needed//' Makefile.config > temp
  mv temp Makefile.config
  make || return 1
}

check() {
  cd $startdir/src/${_pkgname}
  return $(test -x src/elinks)
}

package() {
  cd $startdir/src/${_pkgname}
  make DESTDIR=$pkgdir install
  rm -f $startdir/pkg/$pkgname/usr/share/locale/locale.alias
}
