# Maintainer: M0Rf30

pkgname=namecoin-core
pkgver=0.3.80
pkgrel=2
pkgdesc="Namecoin Core headless P2P node"
arch=('i686' 'x86_64')
url="http://namecoin.info/"
depends=('boost' 'boost-libs' 'miniupnpc' 'openssl')
makedepends=('autoconf' 'automake' 'binutils' 'expect' 'gcc' 'libtool' 'make' 'pkg-config' 'yasm')
license=('MIT')
source=(https://github.com/namecoin/namecoin/archive/nc${pkgver}.tar.gz
        namecoin.conf
        namecoin.logrotate
        namecoin.service
        Makefile)
backup=('etc/namecoin/namecoin.conf'
        'etc/logrotate.d/namecoin')
provides=('namecoin-cli' 'namecoin-daemon' 'namecoin-tx')
conflicts=('namecoin-cli' 'namecoind' 'namecoin-daemon' 'namecoin-qt' 'namecoin-tx')
install=namecoin.install

build() {
  cd "$srcdir/${pkgname%-core}-nc$pkgver"

  msg 'Building...'
  cd src 
  cp $srcdir/Makefile .
  make namecoind
}

package() {
  cd "$srcdir/${pkgname%-core}-nc$pkgver"
  
  msg 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-core}/COPYING"

  msg 'Installing namecoin...'
  install -Dm 775 src/namecoind "$pkgdir/usr/bin/namecoind"

  msg 'Installing namecoin.conf...'
  install -Dm 600 "$srcdir/namecoin.conf" "$pkgdir/etc/namecoin/namecoin.conf"

  msg 'Installing namecoin.service...'
  install -Dm 644 "$srcdir/namecoin.service" "$pkgdir/usr/lib/systemd/system/namecoin.service"

  msg 'Installing namecoin.logrotate...'
  install -Dm 644 "$srcdir/namecoin.logrotate" "$pkgdir/etc/logrotate.d/namecoin"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

md5sums=('450402d3bcd07fbd3a671336d9cb2e7b'
         '020bfdfe192bd21b84964c1e90ae4450'
         '2ca92d94c329bf54b8df70f22c27ba98'
         '1186c6c80cb488e0809a4977ec92399b'
         '701197b708dbb6b5d7568f77ae46f3bb')
