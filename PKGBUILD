# Maintainer: James An <james@jamesan.ca>

pkgname=narg-git
_pkgname=${pkgname%-git}
pkgver=v1.0.r5.g55b9934
pkgrel=1
pkgdesc="Multiarg option parser for C, inspired by python's argparse."
arch=('x86_64' 'i686')
url="https://github.com/anordal/$_pkgname"
license=('GPL')
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/anordal/$_pkgname.git")
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
  mkdir -p "$_pkgname"/build
  cd "$_pkgname"/build

  arch-meson --buildtype=release . ..
  ninja
}

check() {
  cd "$_pkgname"/build

  ninja test
}

package() {
  cd "$_pkgname"/build

  DESTDIR="$pkgdir" ninja install
}
