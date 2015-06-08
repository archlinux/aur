# $Id: PKGBUILD 65577 2012-02-21 09:04:03Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ircservices
pkgver=5.1.24
pkgrel=3
pkgdesc="Services for IRC (NickServ, ChanServ, MemoServ)"
arch=(i686 x86_64)
url="http://www.ircservices.za.net/"
license=('GPL')
depends=('glibc')
makedepends=('patch')
options=('!makeflags' 'emptydirs')
install=ircservices.install
#source=(http://www.ircservices.za.net/download/ircservices-$pkgver.tar.gz
source=(http://achurch.org/services/tarballs/ircservices-$pkgver.tar.gz
	path-patch.patch
	ircservices)
md5sums=('d4f531537aeed230026cf5560f221ecb'
         '7e4bbf6fb398323afc8e85656ec82c13'
         'd5d6409ab04b3a715f9adc29a4fb8a2d')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 <../path-patch.patch
  ./configure -prefix /usr
  sed -i 's#getline#xgetline#' lang/langcomp.c
  make
  sed -i "s#DATDEST=/usr/lib/ircservices#DATDEST=$pkgdir/usr/lib/ircservices#" ./Makefile.inc
  sed -i "s#BINDEST=/usr/sbin#BINDEST=$pkgdir/usr/bin#" ./Makefile.inc
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d -m 0755 $pkgdir/usr/bin
  install -d -m 0755 $pkgdir/usr/lib
  install -d -m 0755 $pkgdir/etc/ircd
  make DESTDIR=$pkgdir install

  install -D -m 0755 $srcdir/ircservices $pkgdir/etc/rc.d/ircservices
  cd $pkgdir && chmod -R ugo+r * && chmod 0755 ./usr/bin/ircservices
  find -type d -exec chmod 0755 {} \;
  install -d -m 0755 $pkgdir/var/lib/ircd
  cd ./var/lib/ircd
  ln -s /usr/lib/ircservices/modules modules
  ln -s /usr/lib/ircservices/languages languages
  ln -s /usr/lib/ircservices/helpfiles helpfiles
  ln -s /etc/ircd/ircservices.conf ircservices.conf
  ln -s /etc/ircd/modules.conf modules.conf

  mkdir -p $pkgdir/var/log/ircd
  mv $pkgdir/usr/lib/ircservices/*.conf $pkgdir/etc/ircd/
}
