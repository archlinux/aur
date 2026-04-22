# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtorrent-rasterbar-2_1-git
pkgver=2.1.0.rc1.r1.g42e0c5da6
pkgrel=1
pkgdesc="A feature complete C++ bittorrent library (git branch RC_2_1)"
arch=('i686' 'x86_64')
url="https://www.libtorrent.org/"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'boost-libs' 'openssl')
makedepends=('git' 'boost' 'cmake' 'python' 'python-setuptools')
provides=("libtorrent-rasterbar=$pkgver" 'libtorrent-rasterbar.so')
conflicts=('libtorrent-rasterbar')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_2_1')
sha256sums=('SKIP')


prepare() {
  cd "libtorrent"

  git submodule update --init --recursive
}

pkgver() {
  cd "libtorrent"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v2\.1\.[0-9\.]+.*$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./g'
}

build() {
  cd "libtorrent"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -Dpython-bindings=ON \
    -Dpython-egg-info=ON \
    -Dboost-python-module-name="python" \
    -Dwebtorrent=ON \
    ./
  cmake --build "_build"
}

package() {
  cd "libtorrent"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libtorrent-rasterbar"
}
