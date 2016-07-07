# Maintainer: James An <james@jamesan.ca>

pkgname="php-cairo-git"
_pkgname=${pkgname%-git}
__pkgname=${_pkgname#php-}
pkgver=1.0.0_dev.r9.9662114
pkgrel=1
pkgdesc="PHP Object Oriented interface to Cairo Graphics library."
arch=('any')
url="https://github.com/gtkforphp/$__pkgname"
depends=('php' "$__pkgname" 'php-datastructures')
license=('PHP')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/gtkforphp/$__pkgname.git#branch=php7")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    release="$(grep VERSION src/php_cairo.h | cut -f2 -d\" | tr - _)"
    hash="$(git blame src/php_cairo.h | grep VERSION | cut -f1 -d\ )"
    revision="$(git rev-list --count $hash..HEAD).$(git rev-parse --short HEAD)"
    printf "%s.r%s" "$release" "$revision"
  )
}

build() {
  cd "$_pkgname"

  phpize
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname"

  NO_INTERACTION=1 make -k test
}

package() {
  cd "$_pkgname"

  make INSTALL_ROOT="$pkgdir/" install
}
