# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=lib32-nss-pam-ldapd
pkgver=0.9.10
pkgrel=1

pkgdesc='LDAP module for NSS and PAM (32-bit)'
url="https://arthurdejong.org/nss-pam-ldapd/"
arch=('x86_64')
license=('LGPL2.1')

depends=('pam' 'python2' 'nss-pam-ldapd')
makedepends=('python2-ldap' 'python2-daemon' 'python2-pylint')
conflicts=('pam_ldap')

provides=('nslcd')

options=('!emptydirs')


source=("https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-$pkgver.tar.gz"{,.sig})

md5sums=('0aeeba1882c5d77108eab24ca6995b8d'
         'SKIP')

validpgpkeys=('452EC2CB65CF68C2A1ADBF5F2A8B746810E0AFC1')

prepare() {
  cd nss-pam-ldapd-$pkgver
  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-pam-seclib-dir=/usr/lib32/security \
    --target=i686-pc-linux-gnu \
    CFLAGS="$CFLAGS -m32" LDFLAGS="$LDFLAGS -m32" PYTHON=python2

  sed -i 's/env python$/env python2/' utils/chsh.py utils/getent.py
}

build() {
  cd nss-pam-ldapd-$pkgver
  make
}

check() {
  cd nss-pam-ldapd-$pkgver
  sed -i 's/ pylint / pylint2 /g' tests/test_pylint.sh
  make check
}

package() {
  cd nss-pam-ldapd-$pkgver

  install -DT nss/nss_ldap.so "${pkgdir}/usr/lib32/libnss_ldap.so"
  install -Dt "${pkgdir}/usr/lib32/security" pam/pam_ldap.so
}

# vim:set ts=2 sw=2 et:
