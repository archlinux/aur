#
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-ipv6
_pkgname=ddclient
pkgver=3.8.3
pkgrel=3
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services, with IPv6 patch"
arch=('any')
url="http://ddclient.sourceforge.net"
license=('GPL2')
depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools' 'perl-regexp-ipv6')
provides=('ddclient')
conflicts=('ddclient')
backup=('etc/ddclient/ddclient.conf')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.bz2
        "ddclient.patch::https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=25;filename=ddclient.patch;att=1;bug=704467"
        "ddclient-invalid_adresses_fix.patch::https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=704467;filename=ddclient.patch;msg=55"
        "0001-cloudflare_ipv6_support.patch"
        "0002-ipv6-regex-fix.patch"
        $_pkgname.service)
md5sums=('3b426ae52d509e463b42eeb08fb89e0b'
         '55c0d00d6127c8834bb839fda19445b0'
         'da70c9cd9ea29557a930783293e9bba8'
         'f476c2bf79307584c114883281cba2d6'
         'b94ea3cf971531ca2f382b1de6fd4b40'
         '1bcd3e75309e658931532adef2a0608a')

prepare(){
  cd "$srcdir"/$_pkgname-$pkgver

	patch -p0 -i "$srcdir"/ddclient.patch
	patch -p3 -i "$srcdir"/ddclient-invalid_adresses_fix.patch
	patch -p0 -i "$srcdir"/0001-cloudflare_ipv6_support.patch
	patch -p0 -i "$srcdir"/0002-ipv6-regex-fix.patch
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm600 sample-etc_$_pkgname.conf "$pkgdir"/etc/$_pkgname/$_pkgname.conf
  install -d "$pkgdir"/var/cache/$_pkgname
  install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/$_pkgname/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/$_pkgname/README.ssl
  install -Dm644 sample-etc_cron.d_$_pkgname "$pkgdir"/usr/share/doc/$_pkgname/sample-etc_cron.d_$_pkgname
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
