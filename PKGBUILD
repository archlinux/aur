# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=freshrss
pkgver=1.23.1
pkgrel=1
pkgdesc='A free, self-hostable aggregator…'
arch=('any')
url='http://freshrss.org/'
license=('AGPL')
depends=('php')
optdepends=('apache: Web server to run FreshRSS'
            'nginx: Web server to run FreshRSS'
            'cherokee: Web server to run FreshRSS'
            'mysql: Database server to run FreshRSS'
            'postgresql: Database server to run FreshRSS'
            'sqlite: Database server to run FreshRSS')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreshRSS/FreshRSS/archive/$pkgver.tar.gz")
sha256sums=('29b3dc7ebc0bc7daffebe2ed135196644d4b053df3bfcc9ee1b5c6437bc2d480')


prepare(){
  cd "${srcdir}/FreshRSS-$pkgver"
  sed -i "s!FRESHRSS_PATH . '/data'!'/var/lib/webapps/freshrss/data'!" constants.php

}


package() {
  cd "${srcdir}/FreshRSS-$pkgver"
  install -d "$pkgdir/usr/share/webapps/freshrss"
  cp -r . "$pkgdir/usr/share/webapps/freshrss/"

  #do some cleanup
  find "$pkgdir/usr/share/webapps/freshrss" -name '.git*' -exec rm -rf {} \; || true
  rm -rf "$pkgdir/usr/share/webapps/freshrss/Docker"
  rm -rf "$pkgdir/usr/share/webapps/freshrss/tests"


  #new location for datadir
  install -dm 755 "$pkgdir/var/lib/webapps/freshrss"
  mv "$pkgdir/usr/share/webapps/freshrss/data" "$pkgdir/var/lib/webapps/freshrss/data"
}

# vim:set ts=2 sw=2 et:
