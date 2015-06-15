# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=l2tp-ipsec-vpn-daemon
pkgver=0.9.9
pkgrel=2
_srcname=l2tp-ipsec-vpn
_srcver=1.0.7
pkgdesc="A daemon to manage L2TP over IPsec virtual private network connections."
arch=('i686' 'x86_64')
url="https://launchpad.net/l2tp-ipsec-vpn"
license=('GPL')
depends=('openswan' 'xl2tpd' 'qt4')
depends=('openswan' 'xl2tpd' 'qt4' 'rsyslog' 'pcsclite')
makedepends=('ctemplate')
optdepends=()
source=(https://launchpad.net/${_srcname}/trunk/${_srcver}/+download/${pkgname}_${pkgver}.tar.gz
        $pkgname.service
        0001-Update-COMMANDS.patch
        0002-Qt4.patch
        $pkgname.tmpfiles.d.conf)
md5sums=('caf8728d035d17bc0b3f971f6d4e76eb'
         '5f85836da92d56a7455380bffc920338'
         'eeafc465e496fa4d8da9178ce35d75b5'
         '4476db63b5eaacb3ad175db313d716f8'
         'd5cf15ac235b1245202bc90c3cbb76f8')
prepare() {
	cd "$srcdir/$pkgname"
  patch -p1 < $srcdir/0001-Update-COMMANDS.patch
  patch -p1 < $srcdir/0002-Qt4.patch
}

build() {
	cd "$srcdir/$pkgname"
  make build
}

package() {
	cd "$srcdir/$pkgname"
  install -D "dist/Release/L2tpIPsecVpnControlDaemon" \
    "$pkgdir/usr/bin/L2tpIPsecVpnControlDaemon"
  install -m744 -D "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -m644 -D "$srcdir/$pkgname.tmpfiles.d.conf" \
    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
