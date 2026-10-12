# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=minizip-ng-git
pkgver=4.2.2.r70.g72d3b39
pkgrel=1
pkgdesc="Fork of the popular zip manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/zlib-ng/minizip-ng"
license=('Zlib')
depends=('glibc' lib{bz2,lzma,zstd}.so 'openssl' 'zlib-ng')
makedepends=('git' 'cmake' 'bzip2' 'xz' 'zstd')
provides=("minizip-ng=$pkgver" 'libminizip-ng.so')
conflicts=('minizip-ng')
source=("git+https://github.com/zlib-ng/minizip-ng.git")
sha256sums=('SKIP')


pkgver() {
  cd "minizip-ng"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "minizip-ng"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    -DMZ_LIB_SUFFIX="-ng" \
    ./
  cmake --build "_build"
}

check() {
  cd "minizip-ng"

  #cmake --build "_build" --target test
}

package() {
  cd "minizip-ng"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/minizip-ng"
}
