# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: 2ion <dev@2ion.de>

pkgname=uchardet-git
pkgver=0.0.8.r98.gab1d2f1
pkgrel=1
pkgdesc="Encoding detector library ported from Mozilla"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/uchardet/"
license=('MPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("uchardet=$pkgver" 'libuchardet.so')
conflicts=('uchardet')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/uchardet/uchardet.git")
sha256sums=('SKIP')


pkgver() {
  cd "uchardet"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "uchardet"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "uchardet"

  #make -C "_build" test
}

package() {
  cd "uchardet"

  make -C "_build" DESTDIR="$pkgdir" install
}
