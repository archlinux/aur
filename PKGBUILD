# Contributor: James An <james@jamesan.ca>

pkgname=terminus
pkgver=4.1.3
pkgrel=1
pkgdesc="The Pantheon CLI - standalone utility for performing operations on the Pantheon Platform https://pantheon.io"
arch=('any')
url="https://github.com/pantheon-systems/$pkgname"
license=('MIT')
depends=('php' 'composer' 'git')
optdepends=('drush: Useful to run incompatible-with-Terminus Drush commands'
            'wp-cli: Useful to run incompatible-with-Terminus WP-CLI commands')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pantheon-systems/$pkgname/archive/$pkgver.tar.gz")
b2sums=('38c7f34f0eaad3c3bdc0f1f376172c03a64886f6761ae0deb51ce09934feed116d3cd61b33ad1ea4c3f0ef9cba64de452a8549f1c4c7b33e25b5d51948d219c6')


prepare() {
  cd "$pkgname-$pkgver"
  composer install \
      --no-interaction \
      --no-dev \
      --prefer-dist \
      --ignore-platform-req=ext-iconv
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
