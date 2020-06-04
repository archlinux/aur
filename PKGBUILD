# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtorrent-rasterbar-1_2-git
pkgver=r16175.g0712c43c6
pkgrel=1
pkgdesc="A feature complete C++ bittorrent library (git branch RC_1_2)"
arch=('i686' 'x86_64')
url="https://www.libtorrent.org/"
license=('BSD')
depends=('boost-libs')
makedepends=('git' 'boost' 'cmake' 'python' 'python-setuptools')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
options=('!strip')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_1_2')
sha256sums=('SKIP')


pkgver() {
  cd "libtorrent"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libtorrent"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -Dpython-bindings=ON \
    -Dboost-python-module-name="python" \
    "../"
  make
}

package() {
  cd "libtorrent"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libtorrent-rasterbar"
}
