# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Nahum Shalman <nshalman at elys dot com>
# Contributor: Brad Arrington <bradla8 at yahoo.com>

pkgname=mod_auth_kerb
pkgver=5.4
pkgrel=6
pkgdesc="A Kerberos authentication module for the Apache Http Server"
arch=('i686' 'x86_64')
url="http://modauthkerb.sourceforge.net/"
license=('custom')
depends=('apache>=2.0' 'krb5')
source=(http://downloads.sourceforge.net/project/modauthkerb/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz
        auth_kerb.conf
        #https://raw.githubusercontent.com/pld-linux/apache-mod_auth_kerb/master/apache-mod_auth_kerb-heimdal.patch
        #https://raw.githubusercontent.com/pld-linux/apache-mod_auth_kerb/master/mod_auth_kerb-apache24.patch
        https://sourceforge.net/p/modauthkerb/patches/_discuss/thread/418c3b51/739d/attachment/mod_auth_kerb-5.4-apache24.patch
        https://raw.githubusercontent.com/pld-linux/apache-mod_auth_kerb/master/mod_auth_kerb-delegation.patch)
sha256sums=('690ddd66c6d941e2fa2dada46588329a6f57d0a3b9b2fd9bf055ebc427558265'
            '9125317197d7dccfb5006982b48a2bd68579bdde0ccfb771671e9e81e9348d1b'
            '069ea2c354d5228fe407e0964be22a5a12a8591a4f0d30fecdfe98422778ba4b'
            '1c4625e1de2904957ac156df220d8d6898d89cdc4712772bd02e564673bb87b9')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p0 < "$srcdir/mod_auth_kerb-5.4-apache24.patch"
  patch -p1 < "$srcdir/mod_auth_kerb-delegation.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --without-krb4 --with-apache="$pkgdir"
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "src/.libs/$pkgname.so" \
                  "$pkgdir/usr/lib/httpd/modules/$pkgname.so"

  install -Dm 644 "LICENSE" \
                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm 644 "$srcdir/auth_kerb.conf" \
                  "$pkgdir/etc/httpd/conf/auth_kerb.conf.sample"
}

# vim: ts=2:sw=2:et:nowrap
