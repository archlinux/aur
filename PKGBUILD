# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn
pkgver=2.3.2
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo2' 'iproute2')
makedepends=('systemd')
license=('custom')
backup=(usr/share/openvpn/easy-rsa/vars
        usr/share/openvpn/easy-rsa/openssl-1.0.0.cnf)
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz.asc
        http://build.openvpn.net/downloads/releases/easy-rsa-2.2.0_master.tar.gz
        http://build.openvpn.net/downloads/releases/easy-rsa-2.2.0_master.tar.gz.asc
        openvpn@.service
        openvpn-2.3.0-fix-systemd-ask-password-path.patch)
md5sums=('06e5f93dbf13f2c19647ca15ffc23ac1'
         'SKIP'
         'fbf818b6e1f212e77b9ce0e6d92584a1'
         'SKIP'
         '57ef7353ba2c28c04dfc387c3ca77a4f'
         'e1bd1523e38745e948c710db1a330bb1')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 -i $srcdir/openvpn-2.3.0-fix-systemd-ask-password-path.patch
  # Build openvpn
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2 \
    --enable-systemd
  make
  # Build easy-rsa
  cd $srcdir/easy-rsa-2.2.0_master
  ./configure --prefix=/usr --with-easyrsadir=/usr/share/openvpn/easy-rsa
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # Install openvpn
  make DESTDIR=$pkgdir install
  install -d -m755 $pkgdir/etc/openvpn
  # Install examples
  install -d -m755 $pkgdir/usr/share/openvpn
  cp -r sample/sample-config-files $pkgdir/usr/share/openvpn/examples
  # Install license
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  # Install contrib
  install -d -m755 $pkgdir/usr/share/openvpn/contrib
  cp -r contrib $pkgdir/usr/share/openvpn
  # Install easy-rsa
  cd $srcdir/easy-rsa-2.2.0_master
  make install DESTDIR=$pkgdir
  rm -f ${pkgdir}/usr/share/openvpn/easy-rsa/openssl-0.9.?.cnf
  # Install rc scripts
  install -D -m644 $srcdir/openvpn@.service $pkgdir/usr/lib/systemd/system/openvpn@.service
}
