# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtorrent-rasterbar-2_0-git
pkgver=r17543.g55111d2c0
pkgrel=1
pkgdesc="A feature complete C++ bittorrent library (git branch RC_2_0)"
arch=('i686' 'x86_64')
url="https://www.libtorrent.org/"
license=('BSD')
depends=('boost-libs' 'openssl')
makedepends=('git' 'boost' 'cmake' 'python' 'python-setuptools')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
options=('!strip')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_2_0')
sha256sums=('SKIP')


prepare() {
  cd "libtorrent"

  git submodule update --init --recursive
}

pkgver() {
  cd "libtorrent"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libtorrent"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -Dpython-bindings=ON \
    -Dpython-egg-info=ON \
    -Dboost-python-module-name="python" \
    ./
  make -C "_build"
}

package() {
  cd "libtorrent"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libtorrent-rasterbar"
}
