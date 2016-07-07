# Maintainer: James An <james@jamesan.ca>

pkgname="php-cairo-git"
_pkgname=${pkgname%-git}
__pkgname=${_pkgname#php-}
pkgver=r205.9662114
pkgrel=2
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
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
