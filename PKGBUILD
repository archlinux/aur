# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=racon-git
pkgver=1.5.0.r0.ga2cfcac
pkgrel=1
pkgdesc="Ultrafast consensus module for raw de novo genome assembly"
arch=('i686' 'x86_64')
url="https://github.com/lbcb-sci/racon"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake')
provides=("racon=$pkgver")
conflicts=('racon')
source=("git+https://github.com/lbcb-sci/racon.git")
sha256sums=('SKIP')


prepare() {
  cd "racon"

  git submodule update --init --recursive
}

pkgver() {
  cd "racon"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "racon"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "racon"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/racon"
}
