# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>
pkgname=nextpnr-ecp5
pkgver=r3723.eb6817c2
pkgrel=1
pkgdesc='Portable FPGA place and route tool'
arch=('i686' 'x86_64')
url='https://github.com/YosysHQ/nextpnr'
license=('custom:ISC')
depends=('boost-libs' 'python' 'qt5-base')
makedepends=('boost' 'cmake' 'eigen' 'git' 'icestorm' 'libtrellis'
             'prjtrellis-db')
provides=('nextpnr-ecp5')
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
    -DARCH=ecp5 \
    -DICEBOX_ROOT=/usr/share/icebox \
    -DTRELLIS_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_OPENMP=ON \
    ..
  make
}

package() {
  cd "$srcdir/nextpnr/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
