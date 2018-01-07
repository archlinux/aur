# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pppd-ldap
pkgver=0.12b
pkgrel=5
pkgdesc="A plugin for PPPD which performs an LDAP-enabled version of pppd"
arch=('x86_64')
url="http://sourceforge.net/projects/pppd-ldap/"
license=('GPL')
_pppver=2.4.7
depends=("ppp=$_pppver" 'libldap')
options=('docs')
source=("https://downloads.sourceforge.net/${pkgname}/pppd_ldap-$pkgver.tgz")
sha256sums=('bb06a71e7826fc615de3344d2b7779406b20dbfcf61e3a3b1a1af706d1eef13a')

build() {
  cd "$srcdir/pppd_ldap-$pkgver"

patch -p1 main.c <<EOF
diff pppd_ldap-0.12b/main.c pppd_ldap-0.12b.my/main.c
56a57,58
> #define LDAP_FILT_MAXSIZ        1024
> 
EOF

patch -p1 utmplib.c <<EOF
diff pppd_ldap-0.12b/utmplib.c pppd_ldap-0.12b.my/utmplib.c
157c157
< 			(char*) buf += rc;
---
> 			buf = (char*)buf + rc;
EOF

  make CFLAGS="-I/usr/include/pppd -fPIC"
}

package() {
  cd "$srcdir/pppd_ldap-$pkgver"
  install -D -m0755 pppd_ldap.so "$pkgdir"/usr/lib/pppd/$_pppver/pppd_ldap.so
  install -D -m0755 README "$pkgdir"/usr/share/doc/pppd-ldap/README
}
