# Maintainer: James An <james@jamesan.ca>

pkgname="php-cairo-git"
_pkgname=${pkgname%-git}
pkgver=0.3.2.beta.r31.g1bc059c
pkgrel=1
pkgdesc="PHP Object Oriented interface to Cairo Graphics library."
arch=('any')
url="https://github.com/gtkforphp/${_pkgname#php-}"
license=('LGPL2')
depends=('php' 'cairo')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/jamesan/${_pkgname#php-}.git")
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
