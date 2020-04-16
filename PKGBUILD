# Maintainer: Gaspard d'Hautefeuille <gaspard@dhautefeuille.eu>
pkgname=hash-slinger
pkgver=3.0
pkgrel=1
pkgdesc="Tools to generate special DNS records (SSHFP, TLSA, OPENPGPKEY, IPSECKEY)"
arch=(any)
url="https://github.com/letoams/hash-slinger"
license=('GPL2')
depends=('python-dnspython' 'python-ipaddress' 'python-m2crypto' 'python-unbound')
makedepends=('xmlto')
optdepends=('openssh: for sshfp'
            'python-gnupg: for openpgpkey'
            'libreswan: for ipseckey (if not using openswan or strongswan)'
            'openswan: for ipseckey (if not using libreswan or strongswan)'
            'strongswan: for ipseckey (if not using libreswan or openswan)')
source=(https://github.com/letoams/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('cd888eaee222bbe994d60aab7bc638b6c3417f43b68d0e6a8f1802104f6d7b8d'
            'SKIP')
validpgpkeys=('F384E78A1D3352D3EB928AB862D3582FE0FD94D2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  for f in ipseckey openpgpkey sshfp tlsa; do
    sed -i 's@#!/usr/bin/python$@#!/usr/bin/env python@' $f
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
