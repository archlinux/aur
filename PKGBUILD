# Maintainer: James An <james@jamesan.ca>

pkgname=terminus-git
_pkgname=${pkgname%-git}
pkgver=1.7.2_dev
pkgrel=1
pkgdesc="The Pantheon CLI — a standalone utility for performing operations on the Pantheon Platform https://pantheon.io"
arch=('any')
url="https://github.com/pantheon-systems/$_pkgname"
license=('MIT')
depends=('php' 'composer' 'git')
optdepends=('drush: Useful to run incompatible-with-Terminus Drush commands'
            'wp-cli: Useful to run incompatible-with-Terminus WP-CLI commands')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/pantheon-systems/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  grep TERMINUS_VERSION config/constants.yml | cut -f2 -d\' | tr '-' '_'
}

prepare() {
  cd "$_pkgname"

  composer install --no-interaction --no-dev --prefer-dist
}

check() {
  cd "$_pkgname"

  scripts/test.sh
}

package() {
  cd "$_pkgname"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/license/$pkgname/LICENSE"

  install -d -m755 "$pkgdir/usr/share/webapps/$pkgname"
  cp -at "$pkgdir/usr/share/webapps/$pkgname" assets bin composer.json composer.lock config src templates vendor
  install -d -m755 "$pkgdir/usr/bin"
  ln --symbolic "/usr/share/webapps/$pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
