# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=hash-slinger
pkgver=2.6
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
md5sums=('9ddea4e6b3df7412213a3a8d33673fab'
         'SKIP')
sha256sums=('121143efea136958ad6a42cb0a8fa80d95b1e4fc45632019d8f07a534d6efab2'
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
