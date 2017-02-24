# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=blasr-git
pkgver=r507.f8bfa9c
pkgrel=1
pkgdesc="The PacBio long read aligner"
arch=('i686' 'x86_64')
url="https://github.com/PacificBiosciences/blasr"
license=('custom')
depends=('hdf5-cpp-fortran')
makedepends=('cmake')
conflicts=('blasr')
provides=('blasr')

source=("git+https://github.com/PacificBiosciences/blasr"
        "git+https://github.com/PacificBiosciences/blasr_libcpp"
        "git+https://github.com/PacificBiosciences/pbbam")

md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $srcdir/blasr

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/blasr

  git submodule init

  git config submodule.libcpp.url $srcdir/blasr_libcpp
  git config submodule.pbbam.url  $srcdir/pbbam

  git submodule update

  mkdir -p build
}

build() {
  cd $srcdir/blasr/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd $srcdir/blasr/build

  make DESTDIR=$pkgdir install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
