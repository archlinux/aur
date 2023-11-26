# Maintainer: Sander Danielsen <thelugal+arch at gmail.com>
pkgname=leafnode
pkgver=1.12.0
pkgrel=1
pkgdesc="implements a store & forward NNTP proxy (client and server) with IPv4 and IPv6"
arch=('x86_64')
url="http://leafnode.sourceforge.net/"
depends=('pcre2' 'xinetd')
license=('GPL')
install=leafnode.install
options=(!emptydirs)
backup=('etc/xinetd.d/leafnode')
validpgpkeys=('DC4A655BD993CD4871FA8210E412B156EFF3855A')
source=(https://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz{,.asc}
	leafnode.xinetd)
sha256sums=('8310b78006a2088b82dcf9a6b18504ec4f7279bd1047af58d3dac5aaf607ce58'
            'a60f887ea7f01b995d2d714a9573f845b4d2ad48dfdf138af60ad7c7e3580240'
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
