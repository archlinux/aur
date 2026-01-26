# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=freshrss
pkgver=1.28.1
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
b2sums=('9bcc4d054d0e277138a1c502c4bcabafde5b592cc710c4c1fdf4a9b521ea215a8651c0e0a5ef7655af30527a9a2b6b414c2fb247c634d735f999d4154a9c11ae')

prepare() {
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
  install -dm 750 "$pkgdir/var/lib/webapps/freshrss"
  mv "$pkgdir/usr/share/webapps/freshrss/data" "$pkgdir/var/lib/webapps/freshrss/data"
}

# vim:set ts=2 sw=2 et:
