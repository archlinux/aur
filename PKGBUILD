# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Nahum Shalman <nshalman at elys dot com>
# Contributor: Brad Arrington <bradla8 at yahoo.com>

pkgname=mod_auth_kerb
pkgver=5.4
pkgrel=5
pkgdesc="A Kerberos authentication module for the Apache Http Server"
arch=('i686' 'x86_64')
#url="http://sourceforge.net/projects/mod_auth_kerb/"
url="http://sourceforge.net/projects/modauthkerb/files/mod_auth_kerb/mod_auth_kerb-5.4/mod_auth_kerb-5.4.tar.gz/download"
license=('custom')
depends=('apache>=2.0' 'krb5')
source=(http://downloads.sourceforge.net/project/modauthkerb/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz
        auth_kerb.conf
        mod_auth_kerb.patch
        mod_auth_kerb_compile.patch
        https://sourceforge.net/p/modauthkerb/patches/_discuss/thread/418c3b51/739d/attachment/mod_auth_kerb-5.4-apache24.patch)
sha256sums=('690ddd66c6d941e2fa2dada46588329a6f57d0a3b9b2fd9bf055ebc427558265'
            '9125317197d7dccfb5006982b48a2bd68579bdde0ccfb771671e9e81e9348d1b'
            'd380254a525e8825ac292394c6b9a8b3f4ba511f72a7552eda7db99fe504d241'
            '1241fe1b44755a355e0ee30e1c3ec2ab71326c252d6558f40068bfc87dce6234'
            '069ea2c354d5228fe407e0964be22a5a12a8591a4f0d30fecdfe98422778ba4b')

prepare() {
  cd "$pkgname-$pkgver"

  #patch -p0 < "$srcdir/mod_auth_kerb.patch"
  patch -p1 < "$srcdir/mod_auth_kerb_compile.patch"
  patch -p0 < "$srcdir/mod_auth_kerb-5.4-apache24.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --without-krb4 --with-apache="$pkgdir"
  make
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/httpd/modules"
  mkdir -p "$pkgdir/etc/httpd/conf"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  install -m 755 "src/.libs/$pkgname.so"  "$pkgdir/usr/lib/httpd/modules"
  install -m 644 "$srcdir/auth_kerb.conf" "$pkgdir/etc/httpd/conf/auth_kerb.conf.sample"
  install -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2:sw=2:et:nowrap
