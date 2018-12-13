# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtorrent-rasterbar-1_2-git
pkgver=1.2.0.r0.g3a1e546a6
pkgrel=1
pkgdesc="A feature complete C++ bittorrent library (git branch RC_1_2)"
arch=('i686' 'x86_64')
url="https://www.libtorrent.org/"
license=('BSD')
depends=('boost-libs')
makedepends=('git' 'boost' 'cmake' 'python' 'python-setuptools' 'python2' 'python2-setuptools')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
options=('!strip')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_1_2')
sha256sums=('SKIP')


pkgver() {
  cd "libtorrent"

  git describe --long --tags | sed 's/^[A-Za-z]*[\-_]//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "$srcdir"

  mkdir -p "py2" "py3"
  _build 2
  _build 3
}

_build() (
  cd "py$1"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -Dpython-bindings=ON \
    -DPYTHON_EXECUTABLE="/usr/bin/python$1" \
    "../libtorrent"
  make
)

package() {
  make -C py2 DESTDIR="$pkgdir" install
  make -C py3 DESTDIR="$pkgdir" install
  install -Dm644 "libtorrent/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
