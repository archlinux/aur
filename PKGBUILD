# Maintainer: James An <james@jamesan.ca>

pkgname=php-datastructures-git
_pkgname=${pkgname%-git}
__pkgname=${_pkgname#php-}
pkgver=r11.c4d68d6
pkgrel=2
pkgdesc='PHP extensions for classes supporting common datastructures'
arch=('any')
url="https://github.com/eosforphp/$_pkgname"
license=('MIT')
depends=('php')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/eosforphp/$__pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}
