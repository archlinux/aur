# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Felix Schindler <aur at felixschindler dot net>

pkgname=ngsolve-git
pkgver=6.2.2405.r0.ge34d7dc
pkgrel=1
pkgdesc="A general purpose Finite Element Library on top of Netgen."
url=https://github.com/ngsolve/ngsolve
license=(LGPL-2.1-only)
arch=(x86_64 i686)
depends=(lapack blas) #netgen-git
makedepends=(git cmake python-pillow python-numpy)
#options=(!buildflags)
source=("git+https://github.com/NGSolve/ngsolve.git"
        "git+https://github.com/NGSolve/netgen.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd ngsolve
  git submodule init
  git config submodule.external_dependencies/netgen.url "${srcdir}/netgen"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd ngsolve
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	local _flags=(
    #-DNETGEN_DIR=/usr \
    #-DUSE_UMFPACK=ON \
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
