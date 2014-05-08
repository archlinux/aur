pkgname=mrouted
pkgver=3.9.6
pkgrel=7
pkgdesc="mrouted is an implementation of the DVMRP multicast routing protocol. It turns a UNIX workstation into a DVMRP multicast router with tunnel support, in order to cross non-multicast-aware routers."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/mrouted"
license=('BSD')
backup=('etc/mrouted.conf')
source=("http://cloud.github.com/downloads/troglobit/mrouted/mrouted-${pkgver}.tar.bz2"
	"mrouted.service")
md5sums=('e88dfa6a99dd4ee7d8bc7b2dca87ca9e'
         'a1ba2643cb169513666a2dcc98e01f4e')

build() {
	cd "$srcdir/${pkgname}-${pkgver}/"
	# and this was supposed to be "easier"?
	sed -i 's|sbin|bin|g' Makefile

	make || return 1
}
package() {
	cd "$srcdir/${pkgname}-${pkgver}/"
	make prefix=/usr DESTDIR=$pkgdir install || return 1
	install -Dm644 $srcdir/mrouted.service "$pkgdir/usr/lib/systemd/system/mrouted.service"
	# and this was supposed to be "easier"?
	mv "$pkgdir/usr/bin/mtrace" "$pkgdir/usr/bin/mrtrace"
	mv "$pkgdir/usr/share/man/man8/mtrace.8" "$pkgdir/usr/share/man/man8/mrtrace.8"
}
