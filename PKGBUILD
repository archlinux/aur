# Maintainer: Tom Tryfonidis <tomtryf@gmail.com>
# Contributors: Tom Tryfonidis <tomtryf@gmail.com>
# 	henning mueller <henning@orgizm.net>
#		Andrew Hamilton

pkgname=euca2ools
pkgver=3.2.0
pkgrel=1
pkgdesc="Command-line tools for interacting with Amazon EC2 and S3 API-compatible Web services using the REST/Query API."
arch=(any)
url=http://www.eucalyptus.com
license=(custom)
depends=('python2-six' 'python2-lxml' 'python2-progressbar' 'python2-requestbuilder' 'python2-requests' 'rsync')
makedepends=('python2-setuptools')
backup=('etc/euca2ools/euca2ools.ini')
source=(http://downloads.eucalyptus.com/software/euca2ools/3.2/source/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('8ce6738d46f5eeb3391da929593159f55c3ab3cc1ca76b119333abadc4ce3d0e'
            'SKIP')
# c1240596: HP Helion Eucalyptus (release key) <euca-security@hp.com>
# https://www.eucalyptus.com/resources/security/keys
validpgpkeys=('8639B2D211BB930D16A2D654BE264D09C1240596')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
  gzip man/*.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  mkdir -p "$pkgdir/usr/share/"{euca2ools/certs,man/man1}
  mkdir -p "$pkgdir/etc/euca2ools/"{bundle-vol,conf.d}

  install -Dm644 conf/euca2ools.ini "$pkgdir/etc/euca2ools/euca2ools.ini"
  install -m644 conf/conf.d/* "$pkgdir/etc/euca2ools/conf.d/"
  install -m644 conf/bundle-vol/* "$pkgdir/etc/euca2ools/bundle-vol/"
  install -m644 certs/* "$pkgdir/usr/share/euca2ools/certs/"
  install -m644 man/*.1.gz "$pkgdir/usr/share/man/man1/"
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

