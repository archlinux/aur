# Maintainer: James An <james@jamesan.ca>
# Contributor: Tess 'socketwench' Flynn <tess@deninet.com>

pkgname=drush-git
_pkgname=${pkgname%-git}
pkgver=9.0.0.alpha1.r1.gb96621d
pkgrel=1
pkgdesc='The Drupal command-line shell, git version.'
arch=('any')
url="http://$_pkgname.org"
license=('GPL')
depends=('bash' 'php-composer' 'php-gd')
makedepends=('git' 'php-box')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname"::"git+https://github.com/$_pkgname-ops/$_pkgname.git#branch=master"
        "php.ini")
md5sums=('SKIP'
          '938cbe5548e3381e63668ea865ad7aa1')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 2>/dev/null
}

prepare() {
  composer --no-interaction --working-dir="$_pkgname" install --prefer-source

  # Generate empty drush.ini from the example by
  # commenting out all line starting with word character.
  sed 's/^\b/;/' "$_pkgname/examples/example.$_pkgname.ini" >| "$_pkgname.ini"
}

build() {
  cd "$_pkgname"

  php -d phar.readonly=Off /usr/bin/php-box build
}

check() {
  cd "$_pkgname"

  msg2 'Verifying PHAR file'
  php -d phar.readonly=Off /usr/bin/php-box verify $_pkgname.phar

  msg2 'Testing on Drupal 6'
  UNISH_DRUPAL_MAJOR_VERSION=6 ./unish.sh
  msg2 'Testing on Drupal 7'
  UNISH_DRUPAL_MAJOR_VERSION=7 ./unish.sh
  msg2 'Testing on Drupal 8'
  UNISH_DRUPAL_MAJOR_VERSION=8 ./unish.sh
}

package() {

  # Set up directory structure
  install --owner=http --group=http --mode=6775  --directory "$pkgdir/etc/drush"
  install --owner=http --group=http --mode=644 "$_pkgname.ini" "$pkgdir/etc/$_pkgname/$_pkgname.ini"
  install --directory "$pkgdir/usr/bin"
  install --directory "$pkgdir/usr/share/webapps/$_pkgname"
  install --directory "$pkgdir/usr/share/doc/$_pkgname/misc"
  install -Dm644 php.ini "$pkgdir/etc/php/conf.d/$_pkgname.ini"

  # Copy main application files
  cd "$_pkgname"
  cp -a * "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a CONTRIBUTING.md README.md docs examples "$pkgdir/usr/share/doc/$_pkgname"
  rm -rf "$pkgdir/usr/share/doc/$_pkgname/"{CONTRIBUTING.md,README.md,docs,examples,misc/windrush_build}
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname.complete.sh" "$pkgdir/etc/bash_completion.d"

  install -Dm644 "$_pkgname.complete.sh" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "examples/example.$_pkgname.ini" "${pkgdir}/etc/$_pkgname/$_pkgname.ini"
  install -Dm644 "examples/example.aliases.${_pkgname}rc.php" "${pkgdir}/etc/$_pkgname/aliases.${_pkgname}rc.php"
  install -Dm644 "examples/example.${_pkgname}rc.php" "${pkgdir}/etc/$_pkgname/${_pkgname}rc.php"
}
