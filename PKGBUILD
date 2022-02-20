# Maintainer: Popolon <popolon@popolon.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Richard Petri <git@rpls.de>
# Contributor: Graham Edgecombe <gpe@grahamedgecombe.com>
_ARCHS=('generic' 'gowin')

pkgname=nextpnr-gowin-git
pkgver=r4016.347ba3af
pkgrel=1
pkgdesc='Portable FPGA place and route tool'
arch=('i686' 'x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://github.com/YosysHQ/nextpnr'
license=('custom:ISC')
depends=('boost-libs' 'python' 'qt5-base')
makedepends=('boost' 'cmake' 'eigen' 'git' 'prjapicula')
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
    -DARCH=$(IFS=\;; echo "${_ARCHS[*]}") \
    -DGOWIN_BBA_EXECUTABLE=/usr/bin/gowin_bba \
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
