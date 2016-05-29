pkgname=openvpn-auth-ldap
pkgver=2.0.3
_debpkgver=2.0.3-5.1
pkgrel=4
pkgdesc="LDAP authentication plugin for openvpn"
arch=(i686 x86_64)
url="http://code.google.com/p/openvpn-auth-ldap/"
license=('BSD')
depends=('openvpn')
makedepends=('gcc-objc' 're2c')
backup=(etc/openvpn/plugins/auth-ldap.conf)
source=(http://openvpn-auth-ldap.googlecode.com/files/auth-ldap-$pkgver.tar.gz
        http://ftp.de.debian.org/debian/pool/main/o/openvpn-auth-ldap/openvpn-auth-ldap_$_debpkgver.debian.tar.gz)
sha1sums=('f03bee8848229825efe42349b5278dad34e5dadf'
          '1f5ee27a8089ff2ae456261f812b40d18fe6bd5c')

prepare() {
  cd "$srcdir/auth-ldap-$pkgver"

  for f in $(< "$srcdir/debian/patches/series"); do
    msg2 "Applying $f"
    patch -Np1 < "$srcdir/debian/patches/$f"
  done

  msg2 "Fixing tests/Makefile.in"
  sed -i 's#{top_builddir}src#{top_builddir}/src#' tests/Makefile.in
}

build() {
  cd "$srcdir/auth-ldap-$pkgver"

  export OBJCFLAGS=-fobjc-abi-version=2
  ./configure \
    --prefix=/usr               \
    --with-openvpn=/usr/include \
    --with-objc-runtime=GNU     ;
  make
}

package() {
  cd "$srcdir/auth-ldap-$pkgver"

  install -Dm0755 src/openvpn-auth-ldap.so  "$pkgdir/usr/lib/openvpn/openvpn-auth-ldap.so"
  install -Dm0644 README                    "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm0644 auth-ldap.conf            "$pkgdir/etc/openvpn/plugins/auth-ldap.conf"
  install -Dm0644 LICENSE                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
