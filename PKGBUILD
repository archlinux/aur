# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=hash-slinger
pkgver=2.7
pkgrel=1
pkgdesc="Tools to generate special DNS records (SSHFP, TLSA)"
arch=(any)
url="http://people.redhat.com/pwouters/hash-slinger/"
license=('GPL2')
depends=('python2-dnspython' 'python2-ipaddr' 'python2-m2crypto' 'python2-unbound')
makedepends=('xmlto')
optdepends=('openssh: for sshfp'
            'python2-gnupg: for openpgpkey'
            'libreswan: for ipseckey (if not using openswan or strongswan)'
            'openswan: for ipseckey (if not using libreswan or strongswan)'
            'strongswan: for ipseckey (if not using libreswan or openswan)')
source=(http://people.redhat.com/pwouters/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc})
md5sums=('02ed1ae7625a966e9b1e69277dba1623'
         'SKIP')
sha256sums=('cd888eaee222bbe994d60aab7bc638b6c3417f43b68d0e6a8f1802104f6d7b8d'
            'SKIP')
validpgpkeys=('F384E78A1D3352D3EB928AB862D3582FE0FD94D2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  for f in ipseckey openpgpkey sshfp tlsa; do
    sed -i 's@#!/usr/bin/python$@#!/usr/bin/env python2@' $f
  done

  # Indentation issue :)
  sed -i 's/        /\t/g' ipseckey
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
