pkgname=mrouted
pkgver=4.2
pkgrel=1
pkgdesc="An implementation of the DVMRP multicast routing protocol. It turns a UNIX workstation into a DVMRP multicast router with tunnel support, in order to cross non-multicast-aware routers."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/mrouted"
license=('BSD')
backup=('etc/mrouted.conf')
depends=('glibc')
source=("https://github.com/troglobit/mrouted/releases/download/${pkgver}/mrouted-${pkgver}.tar.gz"
	"mrouted.service")
md5sums=('b921f9e152e039efdac745438ef8362c'
         'a1ba2643cb169513666a2dcc98e01f4e')

prepare() {
  cd $pkgname-$pkgver
  ./configure
}

build() {
  cd $pkgname-$pkgver
  # and this was supposed to be "easier"?
  sed -i 's|sbin|bin|g' Makefile
  make
}
package() {
  cd $pkgname-$pkgver
  make prefix=/usr DESTDIR=$pkgdir install
  install -Dm644 "$srcdir/mrouted.service" "$pkgdir/usr/lib/systemd/system/mrouted.service"
  # and this was supposed to be "easier"?
  mv "$pkgdir/usr/bin/mtrace" "$pkgdir/usr/bin/mrtrace"
  mv "$pkgdir/usr/share/man/man8/mtrace.8" "$pkgdir/usr/share/man/man8/mrtrace.8"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: se sw=2 et:
