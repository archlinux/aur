# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=libubox
pkgver=r535.gb7acc8e
pkgrel=2
pkgdesc="C utility functions for OpenWrt"
arch=('i686' 'x86_64')
url="https://openwrt.org/docs/techref/libubox"
license=('ISC')
depends=('glibc' 'json-c')
makedepends=('git' 'cmake' 'lua51')
options=('staticlibs')
source=("git+https://git.openwrt.org/project/libubox.git")
sha256sums=('SKIP')


pkgver() {
  cd "libubox"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libubox"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_POLICY_VERSION_MINIMUM="3.5" \
    ./
  cmake --build "_build"
}

package() {
  cd "libubox"

  DESTDIR="$pkgdir" cmake --install "_build"

  if [ -d "$pkgdir/usr/local/lib" ]; then
    mv "$pkgdir"/usr/local/lib/* "$pkgdir/usr/lib"
    rm -r "$pkgdir/usr/local"
  fi
}
