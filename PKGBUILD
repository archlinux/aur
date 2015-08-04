# Maintainer: James An <james@jamesan.ca>
# Contributor: Tess 'socketwench' Flynn <tess@deninet.com>

_pkgname=drush
pkgname=$_pkgname-git
pkgver=8.0.0.beta12.r50.ge0f7248
pkgrel=2
pkgdesc='The Drupal command-line shell, git version.'
arch=('any')
url="https://github.com/drush-ops/$pkgname"
license=('GPL')
depends=('bash' 'php-composer')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$pkgname.install
source=("git://github.com/drush-ops/$_pkgname.git"
        "$_pkgname.ini")
md5sums=('SKIP'
         'ef1a3b084642681c8a39d218284ce13d')

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
}

check() {
  cd "$_pkgname"

  msg2 'Testing on Drupal 6'
  UNISH_DRUPAL_MAJOR_VERSION=6 ./unish.sh
  msg2 'Testing on Drupal 7'
  UNISH_DRUPAL_MAJOR_VERSION=7 ./unish.sh
  msg2 'Testing on Drupal 8'
  UNISH_DRUPAL_MAJOR_VERSION=8 ./unish.sh
}

package() {
  cd "$_pkgname"

  # Set up directory structure
  install -d "$pkgdir/etc/bash_completion.d"
  install -d "$pkgdir/etc/$_pkgname"
  install -d "$pkgdir/etc/skel"
  ln --force --symbolic "/etc/$_pkgname" "$pkgdir/etc/skel/.$_pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/webapps/$_pkgname"
  install -d "$pkgdir/usr/share/doc/$_pkgname/misc"

  # Copy main application files
  cp -rf * "$pkgdir/usr/share/webapps/$_pkgname"
  # Move
  cp -rf CONTRIBUTING.md README.md docs examples "$pkgdir/usr/share/doc/$_pkgname"
  rm -rf "$pkgdir/usr/share/doc/$_pkgname/"{CONTRIBUTING.md,README.md,docs,examples,misc/windrush_build}
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname.complete.sh" "$pkgdir/etc/bash_completion.d"

  install -Dm644 "../$_pkgname.ini" "$pkgdir/etc/$_pkgname/$_pkgname.ini"
}
