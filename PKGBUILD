# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=leafnode
pkgver=1.11.11
pkgrel=1
pkgdesc="implements a store & forward NNTP proxy (client and server) with IPv4 and IPv6"
arch=('x86_64')
url="http://leafnode.sourceforge.net/"
depends=('pcre' 'xinetd')
license=('GPL')
install=leafnode.install
options=(!emptydirs)
backup=('etc/xinetd.d/leafnode')
validpgpkeys=('FDD00C436E3307E10758C6A8BE618339052E7D95')
source=(https://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2{,.asc}
	leafnode.xinetd)
sha256sums=('3ec325216fb5ddcbca13746e3f4aab4b49be11616a321b25978ffd971747adc0'
            'SKIP'
            '14c0a1315ee1de79fb2320dd0a40773e59571c67cedd8d222ba7bbc0a8d8c28c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc/leafnode --sbindir=/usr/bin \
	--with-user=9 \
	--with-group=13
  sed -i 's|#define NEWS_USER .*|#define NEWS_USER "news"|' config.h
  sed -i 's|#define NEWS_GROUP .*|#define NEWS_GROUP "news"|' config.h
  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  chown -R root.root "$pkgdir"
  install -D -m0644 "$srcdir"/leafnode.xinetd "$pkgdir"/etc/xinetd.d/leafnode
}
