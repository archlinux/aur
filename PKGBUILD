# Maintainer: James An <james@jamesan.ca>

pkgname=terminus
pkgver=2.3.0
pkgrel=1
pkgdesc="The Pantheon CLI - standalone utility for performing operations on the Pantheon Platform https://pantheon.io"
arch=('any')
url="https://github.com/pantheon-systems/$pkgname"
license=('MIT')
depends=('php' 'composer' 'git')
optdepends=('drush: Useful to run incompatible-with-Terminus Drush commands'
            'wp-cli: Useful to run incompatible-with-Terminus WP-CLI commands')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pantheon-systems/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3953d78b92b2602910f8f3d53a168d4a')


prepare() {
  cd "$pkgname-$pkgver"

  composer install --no-interaction --no-dev --prefer-dist
}

check() {
  cd "$pkgname-$pkgver"

  scripts/test.sh
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/license/$pkgname/LICENSE"

  install -d -m755 "$pkgdir/usr/share/webapps/$pkgname"
  cp -at "$pkgdir/usr/share/webapps/$pkgname" assets bin composer.json composer.lock config src templates vendor
  install -d -m755 "$pkgdir/usr/bin"
  ln --symbolic "/usr/share/webapps/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
