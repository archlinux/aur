# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn
pkgver=2.2.1
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo2' 'iproute2')
license=('custom')
backup=(usr/share/openvpn/easy-rsa/vars
        usr/share/openvpn/easy-rsa/openssl-1.0.0.cnf
        etc/conf.d/openvpn-tapdev)
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        openvpn.rc
        openvpn-tapdev.rc
        openvpn-tapdev.conf)
md5sums=('500bee5449b29906150569aaf2eb2730'
         'a3809b9727f0c2af2d0770f5c7442db2'
         'd2c48e970088d679dd3c2afd914ff731'
         '722f483c9e3ce2ec66d3301aaf7cf3d5')

build() {
  cd $srcdir/$pkgname-$pkgver
  # Build openvpn
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2
  make

  # Build plugins
  for plug in auth-pam down-root; do
    cd $srcdir/$pkgname-$pkgver/plugin/$plug
    make
  done
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # Install openvpn
  make DESTDIR=$pkgdir install
  install -d -m755 $pkgdir/etc/openvpn
  # Install examples
  install -d -m755 $pkgdir/usr/share/openvpn
  cp -r sample-config-files $pkgdir/usr/share/openvpn/examples
  find $pkgdir/usr/share/openvpn -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/openvpn -type d -exec chmod 755 {} \;
  # Install license
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  # Install plugins
  for plug in auth-pam down-root; do
    cd $srcdir/$pkgname-$pkgver/plugin/$plug
    install -D -m755 openvpn-$plug.so $pkgdir/usr/lib/openvpn/openvpn-$plug.so
    cd -
  done
  # Install contrib
  install -d -m755 $pkgdir/usr/share/openvpn/contrib
  cp -r contrib $pkgdir/usr/share/openvpn
  # Install easy-rsa
  cd $srcdir/$pkgname-$pkgver
  make -C easy-rsa/2.0 install DESTDIR=$pkgdir PREFIX=usr/share/openvpn/easy-rsa
  rm -f ${pkgdir}/usr/share/openvpn/easy-rsa/openssl-0.9.?.cnf
  # Install rc scripts
  install -D -m755 $srcdir/openvpn.rc $pkgdir/etc/rc.d/openvpn
  install -D -m755 $srcdir/openvpn-tapdev.rc $pkgdir/etc/rc.d/openvpn-tapdev
  install -D -m644 $srcdir/openvpn-tapdev.conf $pkgdir/etc/conf.d/openvpn-tapdev
}
