# Maintainer: James An <james@jamesan.ca>

pkgname=drush-config-extra-git
_pkgname=${pkgname%-git}
__pkgname=${_pkgname#drush-}
pkgver=1.0.1.r1.ga6942ba
pkgrel=1
pkgdesc='Additional configuration management Drush commands for Drupal, notably config-merge.'
arch=('any')
url="https://github.com/drush-ops/$__pkgname"
license=('GPL')
depends=('drush')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$__pkgname"::"git+https://github.com/drush-ops/$__pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$__pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "$__pkgname"

  composer --no-interaction update --prefer-source --no-dev --no-autoloader
}

package() {
  cd "$__pkgname"

  path="$pkgdir/usr/share/webapps/drush/commands/$__pkgname"
  install -dm755 "$path"
  cp -a * "$path"
}
