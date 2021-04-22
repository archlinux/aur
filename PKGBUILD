# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=nextpnr-git
pkgver=r3404.3fd1ee77
pkgrel=1
pkgdesc='Portable FPGA place and route tool'
arch=('i686' 'x86_64')
url='https://github.com/YosysHQ/nextpnr'
license=('custom:ISC')
depends=('boost-libs' 'python' 'qt5-base')
makedepends=('boost' 'cmake' 'eigen' 'git' 'icestorm' 'prjtrellis'
             'prjtrellis-db')
provides=('nextpnr')
conflicts=('nextpnr')
source=('nextpnr::git+https://github.com/YosysHQ/nextpnr.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nextpnr"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/nextpnr"

  mkdir -p build
  cd build

  cmake \
    -DARCH=generic\;ice40\;ecp5 \
    -DICESTORM_INSTALL_PREFIX=/usr \
    -DTRELLIS_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_OPENMP=ON \
    -DBUILD_GUI=ON \
    ..
  make
}

check() {
  cd "$srcdir/nextpnr/build"
  make test
}

package() {
  cd "$srcdir/nextpnr/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
