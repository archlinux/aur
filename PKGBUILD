# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=freshrss
pkgver=1.16.0
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
source=("https://github.com/FreshRSS/FreshRSS/archive/$pkgver.tar.gz")
sha256sums=('bd6a131d384c8cfc4b2951d237a4595619788e0b97cfee88f78361524df6d49a')


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
  install -dm 700 "$pkgdir/var/lib/webapps/freshrss"
  mv "$pkgdir/usr/share/webapps/freshrss/data" "$pkgdir/var/lib/webapps/freshrss/data"
}

# vim:set ts=2 sw=2 et:
