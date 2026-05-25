# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Kyle <kyle@free2.ml>

pkgname=opus-git
pkgver=1.6.1.r19.gf8f99516
pkgrel=1
pkgdesc="A codec for interactive speech and audio transmission over the Internet"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://www.opus-codec.org/"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("opus=$pkgver" 'libopus.so')
conflicts=('opus')
source=("git+https://gitlab.xiph.org/xiph/opus.git")
sha256sums=('SKIP')


prepare() {
  cd "opus"

  ./autogen.sh
}

pkgver() {
  cd "opus"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "opus"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    -DOPUS_CUSTOM_MODES=ON \
    -DOPUS_DEEP_PLC=ON \
    -DOPUS_DRED=ON \
    -DOPUS_FORTIFY_SOURCE=OFF \
    -DOPUS_OSCE=ON \
    ./
  cmake --build "_build"
}

package() {
  cd "opus"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "opus.m4" -t "$pkgdir/usr/share/aclocal"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/opus"
}
