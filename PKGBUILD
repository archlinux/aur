# Maintainer: James An <james@jamesan.ca>

pkgname=terminus
pkgver=1.7.1
pkgrel=1
pkgdesc="The Pantheon CLI — a standalone utility for performing operations on the Pantheon Platform https://pantheon.io"
arch=('any')
url="https://github.com/pantheon-systems/$pkgname"
license=('MIT')
depends=('php' 'composer' 'git')
optdepends=('drush: Useful to run incompatible-with-Terminus Drush commands'
            'wp-cli: Useful to run incompatible-with-Terminus WP-CLI commands')
source=("https://github.com/pantheon-systems/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2752d60abe3c3e523c249ccfb2ff4a30')

pkgver() {
  curl "https://api.github.com/repos/pantheon-systems/$pkgname/releases/latest" | grep tag_name | cut -f4 -d\"
}

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
