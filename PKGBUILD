# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=upx-git
pkgver=4.2.3.r17.g90a7faa1
pkgrel=1
pkgdesc="A free, portable, extendable, high-performance executable packer for several executable formats"
arch=('i686' 'x86_64')
url="https://upx.github.io/"
license=('GPL-2.0-or-later')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("upx=$pkgver")
conflicts=('upx')
source=("git+https://github.com/upx/upx.git#branch=devel")
sha256sums=('SKIP')


prepare() {
  cd "upx"

  git submodule update --init --recursive
}

pkgver() {
  cd "upx"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "upx"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DUSE_STRICT_DEFAULTS=OFF \
    ./
  make -C "_build"
}

check() {
  cd "upx"

  #make -C "_build" test
}

package() {
  cd "upx"

  make -C "_build" DESTDIR="$pkgdir" install
}
