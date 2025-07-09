# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtorrent-rasterbar-1_1-git
pkgver=1.1.14.r4.g760f94862
pkgrel=3
pkgdesc="A feature complete C++ bittorrent library (git branch RC_1_1)"
arch=('i686' 'x86_64')
url="https://www.libtorrent.org/"
license=('BSD-3-Clause')
depends=('boost-libs' 'openssl')
makedepends=('git' 'boost' 'cmake' 'python' 'python-setuptools')
provides=("libtorrent-rasterbar=$pkgver")
conflicts=('libtorrent-rasterbar')
options=('!strip')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_1_1')
sha256sums=('SKIP')


pkgver() {
  cd "libtorrent"

  _tag=$(git tag -l --sort -creatordate | grep -E '^libtorrent-1_1_[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libtorrent-//;s/_/./g'
}

build() {
  cd "libtorrent"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -Dpython-bindings=ON \
    -Dboost-python-module-name="python" \
    ./
  cmake --build "_build"
}

package() {
  cd "libtorrent"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libtorrent-rasterbar"
}
