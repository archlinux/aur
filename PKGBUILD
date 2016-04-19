# Maintainer: James An <james@jamesan.ca>
# Contributor: Tess 'socketwench' Flynn <tess@deninet.com>

pkgname=drush-git
_pkgname=${pkgname%-git}
pkgver=9.0.0.alpha1.r64.g5f5f9cf
pkgrel=2
pkgdesc='The Drupal command-line shell, git version.'
arch=('any')
url="http://$_pkgname.org"
license=('GPL')
depends=('bash' 'php-composer' 'php-gd')
makedepends=('git' 'php-box')
#~ checkdepends=('bzr' 'sqlite')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(emptydirs)
install=$pkgname.install
source=("$_pkgname"::"git+https://github.com/$_pkgname-ops/$_pkgname.git#branch=master"
        "php.ini")
md5sums=('SKIP'
         '9627e7e568fa7933fe32b44ad21b219f')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 2>/dev/null
}

prepare() {
  cd "$_pkgname"

  composer --no-interaction update --prefer-source
}

build() {
  cd "$_pkgname"

  php -d phar.readonly=Off /usr/bin/php-box build
}

check() {
  cd "$_pkgname"

  msg2 'Verifying PHAR file'
  php -d phar.readonly=Off /usr/bin/php-box verify $_pkgname.phar

  #~ msg2 'Testing on Drupal 7'
  #~ UNISH_DRUPAL_MAJOR_VERSION=7 UNISH_DB_URL=sqlite://test vendor/bin/phpunit -d extensions=pdo_sqlite.so -d extensions=gd.so--configuration tests
  #~ msg2 'Testing on Drupal 8'
  #~ UNISH_DRUPAL_MAJOR_VERSION=8 UNISH_DB_URL=sqlite://test vendor/bin/phpunit -d extensions=pdo_sqlite.so -d extensions=gd.so--configuration tests
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname.phar" "$pkgdir/usr/share/webapps/$_pkgname/$_pkgname.phar"
  install -Dm644 "$_pkgname.complete.sh" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 ../php.ini "$pkgdir/etc/php/conf.d/$_pkgname.ini"
  install --directory "$pkgdir/usr/bin"
  install --directory "$pkgdir/usr/share/doc/$_pkgname"
  install --directory "$pkgdir/usr/share/webapps/$_pkgname/commands"
  cp -a CONTRIBUTING.md README.md docs examples "$pkgdir/usr/share/doc/$_pkgname"
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname.phar" "$pkgdir/usr/bin/$_pkgname"

  # Symlink upstream's hard-coded drush base path
  ln -s "/usr/share/webapps/$_pkgname" "$pkgdir/usr/share/$_pkgname"

  install -Dm644 "examples/example.aliases.${_pkgname}rc.php" "${pkgdir}/etc/$_pkgname/aliases.${_pkgname}rc.php"
  install -Dm644 "examples/example.${_pkgname}rc.php" "${pkgdir}/etc/$_pkgname/${_pkgname}rc.php"
}
