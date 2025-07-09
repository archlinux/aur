# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hdrhistogram_c-git
pkgver=0.11.8.r6.g652d51b
pkgrel=1
pkgdesc="C port of the HdrHistogram"
arch=('i686' 'x86_64')
url="https://hdrhistogram.github.io/HdrHistogram/"
license=('BSD-2-Clause' 'CC0-1.0')
depends=('glibc' 'zlib')
makedepends=('git' 'cmake')
provides=("hdrhistogram_c=$pkgver")
conflicts=('hdrhistogram_c')
options=('staticlibs')
source=("git+https://github.com/HdrHistogram/HdrHistogram_c.git")
sha256sums=('SKIP')


pkgver() {
  cd "HdrHistogram_c"

  _tag=$(git tag -l --sort -creatordate | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^HdrHistogram_c-//'
}

build() {
  cd "HdrHistogram_c"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "HdrHistogram_c"

  #cmake --build "_build" --target test
}

package() {
  cd "HdrHistogram_c"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {COPYING,LICENSE}.txt -t "$pkgdir/usr/share/licenses/hdrhistogram_c"
}
