# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Nahum Shalman <nshalman at elys dot com>
# Contributor: Brad Arrington <bradla8 at yahoo.com>

pkgname=mod_auth_kerb
pkgver=5.4
pkgrel=4
pkgdesc="A Kerberos authentication module for the Apache Http Server"
arch=('i686' 'x86_64')
#url="http://sourceforge.net/projects/mod_auth_kerb/"
url="http://sourceforge.net/projects/modauthkerb/files/mod_auth_kerb/mod_auth_kerb-5.4/mod_auth_kerb-5.4.tar.gz/download"
license=('custom')
depends=('apache>=2.0' 'krb5')
source=(http://downloads.sourceforge.net/project/modauthkerb/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz
        auth_kerb.conf
        mod_auth_kerb.patch
        mod_auth_kerb_compile.patch)
md5sums=('642b81763ad3ca81dba359cb952da5e3'
         '399f8ab44947ac79f23f718c4ca9a527'
         '3a4ed51a6bfb949fc588148074e1df5a'
         '051f97f87667c92db00f34d20404261d')

prepare() {
  cd "$pkgname-$pkgver"

  #patch -p0 < "$srcdir/mod_auth_kerb.patch"
  patch -p1 < "$srcdir/mod_auth_kerb_compile.patch"
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
