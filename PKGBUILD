# Maintainer: James An <james@jamesan.ca>

pkgname=terminus
pkgver=0.11.2
pkgrel=1
pkgdesc="The Pantheon CLI — a standalone utility for performing operations on the Pantheon Platform https://pantheon.io"
arch=('any')
url="https://github.com/pantheon-systems/$pkgname"
license=('MIT')
depends=('php')
makedepends=('git')
checkdepends=('php-behat' 'phpunit')
optdepends=('composer' 'drush' 'git')
source=("https://github.com/pantheon-systems/$pkgname/releases/download/$pkgver/$pkgname.phar"
        "https://raw.githubusercontent.com/pantheon-systems/$pkgname/$pkgver/LICENSE.txt"
        "https://raw.githubusercontent.com/pantheon-systems/$pkgname/$pkgver/utils/$pkgname-completion.bash")
md5sums=('3d502ca3bf6c24fc4164f8c0a17523c6'
         '727fd1133932956555ff7dbbf03f8d19'
         'ee0ac20ffb763afccf64234c96575b8c')

pkgver() {
  curl "https://api.github.com/repos/pantheon-systems/$pkgname/releases/latest" | grep tag_name | cut -f4 -d\"
}

check() {
  cd "$_pkgname"

  php -d phar.readonly=Off /usr/bin/php-box verify $_pkgname.phar
}

package() {
  install -Dm755 "$pkgname.phar" "$pkgdir/usr/share/webapps/$pkgname/$pkgname.phar"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/license/$pkgname/LICENSE"
  install -Dm644 "$pkgname-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install --directory "$pkgdir/usr/bin"
  ln --symbolic "/usr/share/webapps/$pkgname/$pkgname.phar" "$pkgdir/usr/bin/$pkgname"
}
