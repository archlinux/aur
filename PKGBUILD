# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Felix Schindler <aur at felixschindler dot net>

pkgname=netgen-git
pkgver=6.2.2405.r0.ge51918d
pkgrel=2
pkgdesc="An automatic 3d tetrahedral mesh generator."
url=https://github.com/ngsolve/netgen
license=(LGPL-2.1-only)
arch=(x86_64 i686)
makedepends=(git cmake)
depends=(python tk libxmu glu
         opencascade     # USE_OCC=ON
         #ffmpeg          # USE_MPEG=ON
)
#options=(!buildflags)
provides=(netgen)
conflicts=(netgen)
source=("git+https://github.com/NGSolve/netgen.git"
        "netgen-pybind11::git+https://github.com/NGSolve/pybind11.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd netgen
  git submodule init
  git config submodule.external_dependencies/pybind11.url "${srcdir}/netgen-pybind11"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd netgen
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	local _flags=(
    #-DUSE_JPEG=ON
    #-DUSE_MPEG=ON
    #-DUSE_OCC=ON # On by default
    -DNG_INSTALL_DIR_LIB=lib/netgen
    -DNG_INSTALL_DIR_INCLUDE=include/netgen
	)

  cmake -B build -S "netgen" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # remove reference to srcdir
  sed -i "s;${srcdir}/;;g" ${pkgdir}/usr/lib/cmake/netgen/NetgenConfig.cmake
}

