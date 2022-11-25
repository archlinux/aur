# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=fi
_pkgname=f-irc
arch=('i686' 'x86_64')
pkgver=1.36
pkgrel=1
pkgdesc="f-irc is an irc terminal client"
license=('unknown')
depends=('ncurses')
url="https://web.archive.org/web/20181207164751/https://vanheusden.com/f-irc/"
source=("http://deb.debian.org/debian/pool/main/f/f-irc/f-irc_${pkgver}.orig.tar.gz"
        "fix_ftbfs.patch")
sha256sums=('b5fad4383ab905ec5ca5865325e72a4b2c8f0e7c08d3bb8e7419aad12d9a6dc7'
         'e166168a733bcd909b672f5e47a1bda59e391ebb4f4fca588c78a702ed1ca7fd')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/fix_ftbfs.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i '/ln /s%.*%	ln -s /usr/bin/fi $(DESTDIR)/bin/f-irc%' Makefile
  sed -i '/include/s%ncursesw/%%' *.c *.h
 make
}

package() {
  mkdir -p ${pkgdir}/{usr/{bin,share/man/man1},etc}
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/usr SYSCONFDIR=${pkgdir}/etc install
  install -Dm644 firc.ignore ${pkgdir}/etc
  #sed -i 's/ignore_file=firc.ignore/ignore_file=\/etc\/firc.ignore/' ${pkgdir}/etc/firc.conf
}
