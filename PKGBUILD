# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=freshrss
pkgver=1.27.1
pkgrel=1
pkgdesc='A free, self-hostable aggregator…'
arch=('any')
url='http://freshrss.org/'
license=('AGPL-3.0-only')
depends=('php-interpreter>=8.1')
optdepends=('apache: Web server to run FreshRSS'
            'nginx: Web server to run FreshRSS'
            'mysql: Database server to run FreshRSS'
            'postgresql: Database server to run FreshRSS'
            'sqlite: Database server to run FreshRSS')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreshRSS/FreshRSS/archive/$pkgver.tar.gz")
b2sums=('5abedc2d2b611974b14a504b3e78768ad3a4e8fde1268a038fa384364b7488f822a03d62a9a22c3ba4d2ad394139ba9dbfbae13f1b1c88df05496a344feb6a3b')


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
