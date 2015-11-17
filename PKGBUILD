# Maintainer: James An <james@jamesan.ca>
# Contributor: Tess 'socketwench' Flynn <tess@deninet.com>

_pkgname=drush
pkgname=$_pkgname-git
pkgver=8.0.0.rc4.r10.gf303433
pkgrel=1
pkgdesc='The Drupal command-line shell, git version.'
arch=('any')
url="https://github.com/drush-ops/$pkgname"
license=('GPL')
depends=('bash' 'php-composer' 'php-gd')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$pkgname.install
source=("git://github.com/drush-ops/$_pkgname.git"
        "errors.$_pkgname.ini"
        "req.$_pkgname.ini")
md5sums=('SKIP'
         '2c661b0268411ad82e33ca314424637a'
         'fd34300a8ce7ca8e826cb8b9a5ed2b89')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 2>/dev/null
}

prepare() {
  composer update --prefer-source --no-interaction --working-dir "$_pkgname"
  composer install --prefer-source --no-interaction --working-dir "$_pkgname"
  for extension in gd mysqli pdo_mysql; do
    echo "extension=$extension.so" >| "$extension.$_pkgname.ini"
  done
  sed -r 's/^([^;$])/;\1/' "$_pkgname/examples/example.$_pkgname.ini" >| "$_pkgname.ini"
}

check() {
  cd "$_pkgname"

  #~ msg2 'Testing on Drupal 6'
  #~ UNISH_DRUPAL_MAJOR_VERSION=6 ./unish.sh
  #~ msg2 'Testing on Drupal 7'
  #~ UNISH_DRUPAL_MAJOR_VERSION=7 ./unish.sh
  #~ msg2 'Testing on Drupal 8'
  #~ UNISH_DRUPAL_MAJOR_VERSION=8 ./unish.sh
}

package() {
  # Install PHP configuration files
  for conf in errors gd mysqli pdo_mysql req; do
    install -Dm644 "$conf.$_pkgname.ini" "$pkgdir/etc/php/conf.d/$conf.$_pkgname.ini"
  done

  # Set up directory structure
  install --directory "$pkgdir/etc/bash_completion.d"
  install --directory --owner=http --group=http --mode=6775 "$pkgdir/etc/$_pkgname"{,/cache{,/{default,download,usage}}}
  install --owner=http --group=http --mode=644 "$_pkgname.ini" "$pkgdir/etc/$_pkgname/$_pkgname.ini"
  install --directory "$pkgdir/usr/bin"
  install --directory "$pkgdir/usr/share/webapps/$_pkgname"
  install --directory "$pkgdir/usr/share/doc/$_pkgname/misc"

  # Copy main application files
  cd "$_pkgname"
  cp -a * "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a CONTRIBUTING.md README.md docs examples "$pkgdir/usr/share/doc/$_pkgname"
  rm -rf "$pkgdir/usr/share/doc/$_pkgname/"{CONTRIBUTING.md,README.md,docs,examples,misc/windrush_build}
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname.complete.sh" "$pkgdir/etc/bash_completion.d"
}
