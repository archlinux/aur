# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=mrouted
pkgver=4.5
pkgrel=1
pkgdesc="An implementation of the DVMRP multicast routing protocol. It turns a UNIX workstation into a DVMRP multicast router with tunnel support, in order to cross non-multicast-aware routers."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/mrouted"
license=('BSD')
depends=('glibc')
source=("https://github.com/troglobit/mrouted/releases/download/${pkgver}/mrouted-${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --runstatedir=/run \
    --with-systemd=/usr/lib/systemd/system \
    ;
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # rename mtrace to mrtrace due to conflict with glibc
  mv "$pkgdir/usr/bin/mtrace" "$pkgdir/usr/bin/mrtrace"
  mv "$pkgdir/usr/share/man/man8/mtrace.8" "$pkgdir/usr/share/man/man8/mrtrace.8"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('99e1a1ca45e4e6c05b3cf379fd59a239aeabd9512656114528ad5e172d3c8ba8')

# vim: se sw=2 et ts=2:
