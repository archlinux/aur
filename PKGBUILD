# Maintainer: James An <james@jamesan.ca>

pkgname=drush-launcher-git
_pkgname=${pkgname%-git}
__pkgname=${_pkgname%-launcher}
pkgver=0.5.1.r1.gace4b71
pkgrel=1
pkgdesc='A small wrapper around Drush for your global $PATH.'
arch=('any')
url="https://github.com/drush-ops/drush-launcher"
license=('GPL')
depends=('php-composer')
makedepends=('git' 'php-box')
provides=("$__pkgname" "$_pkgname=$pkgver")
conflicts=("$__pkgname" "$_pkgname")
source=("$_pkgname"::"git+https://github.com/$__pkgname-ops/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (   set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 2>/dev/null
}

prepare() {
  cd "$_pkgname"

  composer --no-interaction install --prefer-source
}

build() {
  cd "$_pkgname"

  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "$_pkgname"

  install -Dm755 "$__pkgname.phar" "$pkgdir/usr/bin/$__pkgname"
}
