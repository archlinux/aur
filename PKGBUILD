# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hdrhistogram_c-git
pkgver=0.11.6.r0.g733b470
pkgrel=1
pkgdesc="C port of the HdrHistogram"
arch=('i686' 'x86_64')
url="https://hdrhistogram.github.io/HdrHistogram/"
license=('BSD' 'custom:CC0')
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

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "HdrHistogram_c"

  make -C "_build" test
}

package() {
  cd "HdrHistogram_c"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 {COPYING,LICENSE}.txt -t "$pkgdir/usr/share/licenses/hdrhistogram_c"
}
