# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=hcxdumptool
pkgdesc="Small tool to capture packets from wlan devices"
license=('MIT')
arch=('i686' 'x86_64')

pkgver=4.2.1
pkgrel=1

url="https://github.com/ZerBea/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZerBea/$pkgname/archive/$pkgver.tar.gz")

md5sums=('2038f03b8ee0918bfab94dffd0873d00')

makedepends=('make' 'gcc')

depends=('curl' 'libpcap' 'zlib' 'openssl')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  # FIXME: this is a hack for the broken build system to ensure rebuilds
  rm -rf build
  make DESTDIR=$pkgdir PREFIX=/usr INSTALLDIR=$pkgdir/usr/bin
  # FIXME: this is a hack for the broken build system to prevent rebuilds
  touch build
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir PREFIX=/usr INSTALLDIR=$pkgdir/usr/bin install

  for _docfile in README.md changelog; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_bpn}/${_docfile}"
  done
  
  install -D -v -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
