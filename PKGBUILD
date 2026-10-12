# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=zlib-git
pkgname=('zlib-git') # minizip-git
pkgver=1.3.2.r110.g767c4c94
pkgrel=1
pkgdesc="A massively spiffy yet delicately unobtrusive compression library (git develop branch)"
arch=('i686' 'x86_64')
url="https://www.zlib.net/"
license=('Zlib')
depends=('glibc')
makedepends=('git')
options=('staticlibs')
source=("git+https://github.com/madler/zlib.git#branch=develop")
sha256sums=('SKIP')


pkgver() {
  cd "zlib"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "zlib"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make

  cd "contrib/minizip"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "zlib"

  #make test
  #make -C "contrib/minizip" test
}

package_zlib-git() {
  pkgdesc="A massively spiffy yet delicately unobtrusive compression library (git develop branch)"
  provides=("zlib=$pkgver" "zlib-static=$pkgver" 'libz.so')
  conflicts=('zlib' 'zlib-static')

  cd "zlib"

  make DESTDIR="$pkgdir" install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/zlib"
}

package_minizip-git() {
  pkgdesc="Mini zip and unzip based on zlib"
  depends+=('zlib')
  provides=("minizip=$pkgver" 'libminizip.so')
  conflicts=('minizip')

  cd "zlib/contrib/minizip"

  make DESTDIR="$pkgdir" install

  install -Dm644 "../../LICENSE" -t "$pkgdir/usr/share/licenses/minizip"
}
