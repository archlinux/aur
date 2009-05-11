# Maintainer: Judd Vinet <jvinet@zeroflux.org>

pkgname=openvpn
pkgver=2.0.9
pkgrel=5
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.sourceforge.net/"
depends=('openssl' 'lzo2')
license=('custom')
backup=(usr/share/openvpn/easy-rsa/vars usr/share/openvpn/easy-rsa/openssl.cnf)
source=(http://openvpn.net/release/openvpn-$pkgver.tar.gz)
md5sums=('60745008b90b7dbe25fe8337c550fec6')
install=openvpn.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-password-save --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  mkdir -p $pkgdir/etc/openvpn
  cp -a sample-config-files $pkgdir/etc/openvpn/examples
  chmod 755 $pkgdir/etc/openvpn/examples
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

  # Install easy-rsa
  make -C easy-rsa/2.0 install DESTDIR=$pkgdir PREFIX=usr/share/openvpn/easy-rsa
}
