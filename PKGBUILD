# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Felix Schindler <aur at felixschindler dot net>

pkgname=ngsolve-git
pkgver=6.2.2506.r203.gf6f7fcf
pkgrel=1
pkgdesc="A general purpose Finite Element Library on top of Netgen."
url=https://github.com/ngsolve/ngsolve
license=(LGPL-2.1-only)
arch=(x86_64 i686)
depends=(lapack blas python python-pillow python-numpy python-scipy python-matplotlib python-mpi4py glibc gcc-libs gcc-libs sh)
makedepends=(git cmake python-pybind11-stubgen opencascade glu libxmu)
source=("git+https://github.com/NGSolve/ngsolve.git"
        "git+https://github.com/NGSolve/netgen.git"
		"netgen-pybind11::git+https://github.com/NGSolve/pybind11.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd ngsolve
  git submodule init
  git config submodule.external_dependencies/netgen.url "${srcdir}/netgen"
  git -c protocol.file.allow=always submodule update

  cd external_dependencies/netgen
  git submodule init
  git config submodule.external_dependencies/pybind11.url "${srcdir}/netgen-pybind11"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd ngsolve
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	local _flags=(
    #-DNETGEN_DIR=/usr
    #-DUSE_UMFPACK=ON
	)

  cmake -B build -S "ngsolve" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
