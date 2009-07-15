# Maintainer: Judd Vinet <jvinet@zeroflux.org>

pkgname=openvpn
pkgver=2.1_rc18
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.sourceforge.net/"
depends=('openssl' 'lzo2')
license=('custom')
backup=(usr/share/openvpn/easy-rsa/vars usr/share/openvpn/easy-rsa/openssl.cnf)
source=(http://openvpn.net/release/openvpn-$pkgver.tar.gz)
md5sums=()
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
  # build pam-auth
  cd $srcdir/$pkgname-$pkgver/plugin/auth-pam
  make || return 1 
  install -D -m755 openvpn-auth-pam.so $pkgdir/usr/share/openvpn/plugin/lib/openvpn-auth-pam.so
  # build down-root
  cd $srcdir/$pkgname-$pkgver/plugin/down-root
  make || return 1 
  install -D -m755 openvpn-down-root.so $pkgdir/usr/share/openvpn/plugin/lib/openvpn-down-root.so
  # Install easy-rsa
  cd $srcdir/$pkgname-$pkgver
  make -C easy-rsa/2.0 install DESTDIR=$pkgdir PREFIX=usr/share/openvpn/easy-rsa
}
