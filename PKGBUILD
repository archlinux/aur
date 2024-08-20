# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libid3tag-git
pkgver=0.16.3.r0.ge02ecf1
pkgrel=1
pkgdesc="Library for reading ID3 metadata tags from MP3 files"
arch=('i686' 'x86_64')
url="https://codeberg.org/tenacityteam/libid3tag"
license=('GPL-2.0-or-later')
depends=('glibc' 'zlib')
makedepends=('git' 'cmake')
provides=("libid3tag=$pkgver" 'libid3tag.so')
conflicts=('libid3tag')
source=("git+https://codeberg.org/tenacityteam/libid3tag.git")
sha256sums=('SKIP')


pkgver() {
  cd "libid3tag"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libid3tag"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "libid3tag"

  #cmake --build "_build" --target test
}

package() {
  cd "libid3tag"

  DESTDIR="$pkgdir" cmake --install "_build"
}

