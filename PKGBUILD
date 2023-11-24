# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hengfu <rhfcaesar@gmail.com>

pkgname=xl2tpd-watchguard
pkgver=1.3.18
pkgrel=1
pkgdesc="an open source implementation of the L2TP maintained by Xelerance Corporation, with patсh to fix disconnects from Watchguard server"
arch=('x86_64')
#url="https://www.xelerance.com/services/software/xl2tpd/"
url="https://github.com/xelerance/xl2tpd"
license=('GPL')
depends=('ppp')
options=(emptydirs zipman docs)
backup=(etc/ppp/options.l2tpd)
provides=('xl2tpd')
conflicts=('xl2tpd')
source=($pkgname-$pkgver.tar.gz::https://github.com/xelerance/xl2tpd/archive/v$pkgver.tar.gz
	xl2tpd.conf.client-example
	xl2tpd.conf.server-example
	options.l2tpd
	xl2tpd.service
	xl2tpd.tmpfiles
  watchguard.patch)
sha256sums=('47f52b9c56cabe77766533bca3736a8198581ff38443eb4b4c8971c885ac9329'
            '444e84a01d9c379eb5cf25584451ccd06aad48e611c557eb572ba4f220af3ad7'
            '24d5588b0c8194b7763579be75a58c88e72296145d8d223e1549454e18665ba4'
            '8295d3f7522407beafb89d92b53c29ab80d7a5b18a0d3182dd65a18d88a05590'
            'ff34172f95ae66865a0919c6fb7279c9b80114a59b5b2cf790667f35e83f86e5'
            '70ac11e6fe097ad271d878565930aa85dfa75d5cd62d6c35dd580b2ee34e660b'
            '325dda02c6a134c204a31265b7714364b87b6eb87fa0bc72074b01fe0e81e516')

prepare() {
    patch -u "$srcdir/xl2tpd-$pkgver"/control.c -i watchguard.patch
}

build() {
  cd "$srcdir/xl2tpd-$pkgver"

  make KERNELSRC=/usr/src/linux-`uname -r` PREFIX=/usr SBINDIR=/usr/bin
}

package() {
  cd "$srcdir/xl2tpd-$pkgver"

  make KERNELSRC=/usr/src/linux-`uname -r` PREFIX=/usr DESTDIR="$pkgdir"  SBINDIR="$pkgdir"/usr/bin install

  install -D -m0644 "$srcdir"/xl2tpd.conf.client-example "$pkgdir"/etc/xl2tpd/xl2tpd.conf.client-example
  install -D -m0644 "$srcdir"/xl2tpd.conf.server-example "$pkgdir"/etc/xl2tpd/xl2tpd.conf.server-example
  install -D -m0644 "$srcdir"/options.l2tpd "$pkgdir"/etc/ppp/options.l2tpd

  install -Dm0644 "$srcdir"/xl2tpd.service "$pkgdir"/usr/lib/systemd/system/xl2tpd.service
  install -Dm0644 "$srcdir"/xl2tpd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/xl2tpd.conf
}
