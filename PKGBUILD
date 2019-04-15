# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Martin Sandsmark <sandsmark@iskrembilen.com>
# vim:set ts=2 sw=2 et:
pkgname=ndt
pkgver=3.7.0.2
pkgrel=2
pkgdesc="The Network Diagnostic Tool (NDT) is a client/server program that provides network configuration and performance testing"
arch=('x86_64')
url="http://www.internet2.edu/performance/ndt/index.html"
license=('BSD')
depends=('jopenchart' 'openssl' 'jansson' 'zlib')
makedepends=('i2util')
source=(http://software.internet2.edu/sources/ndt/$pkgname-$pkgver.tar.gz)
md5sums=('30cddd43f76a2be1b3764904d5a9e0c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-java=no --enable-flash=no --with-flash=no
  # XXX: The CLASSPATH specification looks bodgey...
  make ndtdir="/usr/share/java/ndt" CLASSPATH_ENV="CLASSPATH=/usr/share/java/jopenchart/charting-0.94.jar" || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ndtdir="$pkgdir/usr/share/java/ndt" prefix="$pkgdir/usr" install

  # namcap complains about these
  rmdir "$pkgdir/usr/sbin"
  rmdir "$pkgdir/usr/share/java/ndt/serverdata"

  mkdir -p $pkgdir/usr/share/doc/$pkgname-$pkgver
  cp AUTHORS ChangeLog DISCUSSION-LIST NEWS README Readme-fakewww Readme-web100srv tcpbw100.template $pkgdir/usr/share/doc/$pkgname-$pkgver
}

