# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtorrent-rasterbar-1_2-git
pkgver=1.2.20.r3.g3ae563b04
pkgrel=1
pkgdesc="A feature complete C++ bittorrent library (git branch RC_1_2)"
arch=('i686' 'x86_64')
url="https://www.libtorrent.org/"
license=('BSD-3-Clause')
depends=('boost1.86-libs' 'openssl')
makedepends=('git' 'boost1.86' 'cmake' 'python' 'python-setuptools')
provides=("libtorrent-rasterbar=$pkgver")
conflicts=('libtorrent-rasterbar')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_1_2')
sha256sums=('SKIP')


pkgver() {
  cd "libtorrent"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v1\.2[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libtorrent"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBOOST_ROOT="/opt/boost1.86" \
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
