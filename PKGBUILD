# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Myles English <myles at tdma dot co>

pkgname=pastix
pkgver=6.4.0
pkgrel=2
pkgdesc="High performance parallel solver for very large sparse linear systems based on direct methods"
arch=(x86_64)
url="https://gitlab.inria.fr/solverstack/pastix"
license=(LGPL-3.0-only)
depends=(
  cblas
  hwloc
  lapacke
  metis
  openmpi
  python
  scotch
)
makedepends=(
  gcc-fortran
  cmake
  ninja
  doxygen
  git
)
provides=(
  libpastix.so
  libpastix_kernels.so
  # also provide the SpM library (internal module)
  libspm.so
  libspmf.so
)
source=("https://files.inria.fr/pastix/releases/v${pkgver%%.*}/pastix-${pkgver}.tar.gz")
b2sums=('a3b8bf29cd4db82a8a6622486024d01f72210157068b4fd82a7e68d3e2ddcd8a66849bd25f7a730ce82365e779f25cc2b6ea8334dbba6f742ad88e776e2cb994')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=ON
    -D BUILD_DOCUMENTATION=ON
    -D PASTIX_ORDERING_METIS=ON
    -D PASTIX_WITH_MPI=ON
    -D PASTIX_INT64=OFF   # because scotch is not compiled with int64
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
