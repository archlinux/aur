# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=miredo
pkgver=1.2.6
pkgrel=4
pkgdesc="Teredo client and server."
arch=('x86_64')
url="http://www.remlab.net/miredo/"
license=('GPL')
depends=('judy' 'iproute2' 'libcap')
backup=('etc/miredo/miredo.conf'
        'etc/miredo/client-hook')
validpgpkeys=('9480583353E334D2F03FE80CC3EC6DBEDD6D12BD')
source=(http://www.remlab.net/files/${pkgname}/${pkgname}-${pkgver}.tar.xz{,.asc}
	miredo.service)
sha256sums=('fa26d2f4a405415833669e2e2e22677b225d8f83600844645d5683535ea43149'
            'SKIP'
            '6985563b19de2d8cea7d080a72acb8874cf358315042231c9ea64721c66c3279')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--libexecdir=/usr/lib \
	--sbindir=/usr/bin \
	--with-Judy \
	--disable-assert
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  sed -i 's#/sbin/ip#/usr/bin/ip#' "$pkgdir"/etc/miredo/client-hook
  rmdir "$pkgdir/var/run" "$pkgdir/var"
  install -Dm644 "$srcdir/miredo.service" "$pkgdir/usr/lib/systemd/system/miredo.service"
}
