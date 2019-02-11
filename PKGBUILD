# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Tom Tryfonidis <tomtryf@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: Andrew Hamilton

pkgname=euca2ools
pkgver=3.4.1
pkgrel=1
pkgdesc="Command-line tools for interacting with Amazon EC2 and S3 API-compatible Web services using the REST/Query API."
arch=(any)
url=http://www.eucalyptus.com
license=(custom)
depends=('python2-six' 'python2-lxml' 'python2-progressbar' 'python2-requestbuilder' 'python2-requests' 'rsync')
makedepends=('python2-setuptools')
backup=('etc/euca2ools/euca2ools.ini')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eucalyptus/euca2ools/archive/v$pkgver.tar.gz")
sha256sums=('98adeff07331147da869ffd7574bf69d6e720e28a6d20b608b9b4b646b851b75')

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
