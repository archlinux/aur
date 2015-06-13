# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=revbayes-mpi-git

pkgver=r4177.93b7c7c
pkgrel=1
pkgdesc="bayesian phylogenetic inference using probabilistic graphical models and an interpreted language"
arch=(i686 x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=(openmpi)
makedepends=(boost cmake git)
conflicts=('revbayes-mpi')
provides=('revbayes-mpi')

source=("revbayes-git::git+https://github.com/revbayes/revbayes")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/revbayes-git

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/revbayes-git

  rm -rf boost_1_55_0

  mkdir -p build

  cd projects/cmake
  ./regenerate.sh -boost false -mpi true
}

build() {
  cd $srcdir/revbayes-git/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../projects/cmake

  make
}

package() {
  cd $srcdir/revbayes-git/build

  install -Dm755 rb-mpi $pkgdir/usr/bin/rb-mpi
}
