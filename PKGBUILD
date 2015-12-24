# Maintainer: James An <james@jamesan.ca>

pkgname=php-gtk-git
_pkgname=${pkgname%-git}
pkgver=2.0.1.r0.gc959799
pkgrel=1
pkgdesc="PHP language bindings for GTK+ 2 toolkit."
arch=('any')
url="https://github.com/php/$_pkgname-src"
license=('LGPL2')
depends=('gtk2')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/php/$_pkgname-src.git")
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

  ./buildconf
  ./configure --prefix=/usr --without-libglade
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
