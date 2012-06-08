# $Id$
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.8.1
pkgrel=4
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services."
arch=('any')
url="http://ddclient.sourceforge.net/"
license=('GPL2')
depends=('perl' 'perl-io-socket-ssl')
backup=('etc/ddclient/ddclient.conf' 'etc/conf.d/ddclient')
install=ddclient.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
      ddclient.rc
        ddclient.conf.d
        ddclient.service
        iproute2.patch)

build() {
  cd ${srcdir}/ddclient-${pkgver}

  patch -p1 < "$srcdir/iproute2.patch"
}

package() {
  cd ${srcdir}/ddclient-${pkgver}

  # core files
  install -D -m755 ddclient ${pkgdir}/usr/sbin/ddclient
  install -D -m755 ${srcdir}/ddclient.rc ${pkgdir}/etc/rc.d/ddclient
  install -D -m600 sample-etc_ddclient.conf ${pkgdir}/etc/ddclient/ddclient.conf
  install -D -m644 ${srcdir}/ddclient.conf.d ${pkgdir}/etc/conf.d/ddclient
  install -d ${pkgdir}/var/cache/ddclient

  # additional instructions, sample configs
  install -D -m644 README ${pkgdir}/etc/ddclient/samples/README
  install -D -m644 sample-etc_cron.d_ddclient ${pkgdir}/etc/ddclient/samples/sample-etc_cron.d_ddclient
  install -D -m644 sample-etc_dhcpc_dhcpcd-eth0.exe ${pkgdir}/etc/ddclient/samples/sample-etc_dhcpc_dhcpcd-eth0.exe
  install -D -m644 sample-etc_ppp_ip-up.local ${pkgdir}/etc/ddclient/samples/sample-etc_ppp_ip-up.local
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
md5sums=('7fa417bc65f8f0e6ce78418a4f631988'
         '10af4667b7269132b8f0cdfc26864d89'
         'b8f39c82827776da948b76ef83544d33'
         'fde631ff027c03179e9cdd483def324d'
         'e0c8a07e9b7a69e73cecd8626f16e8f0')
