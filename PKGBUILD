# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libvarlink-git
pkgver=23.r10.ga1a34ce
pkgrel=1
pkgdesc="Varlink C library and command line tool"
arch=('i686' 'x86_64')
url="https://varlink.org/"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'meson')
provides=("libvarlink=$pkgver")
conflicts=('libvarlink')
source=("git+https://github.com/varlink/libvarlink.git")
sha256sums=('SKIP')


pkgver() {
  cd "libvarlink"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libvarlink"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "libvarlink"

  #meson test -C "_build"
}

package() {
  cd "libvarlink"

  meson install -C "_build" --destdir "$pkgdir"
}
