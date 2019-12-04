# Maintainer: Myles English <myles at rockhead.biz>
# Contributor: Feng Wang <wanng.fenng@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

######################################################################
# CAVEAT LECTOR
######################################################################
#
# Make sure you have enough RAM to build this package.
# It consumes about 6GB RAM for me when building, even if I
# keep the src dir on the disk instead of a tmpfs!
#
# Keeping the srcdir and using ccache option for faster compilation
# the next time would be a good choice.
#
# "makepkg -i" is your friend.
#
######################################################################

pkgname=trilinos-git
_pkgname=Trilinos
pkgver=12.12.11145.g7a152b4248
pkgrel=1
pkgdesc="Algorithms for the solution of large-scale, complex multi-physics engineering and scientific problems."
arch=('x86_64')
url="https://github.com/trilinos/Trilinos"
license=('LGPL3')
depends=('lapack' 'openmpi' 'python2' 'boost')
provides=('trilinos')
conflicts=('trilinos')
source=(git+${url}.git)
makedepends=('git' 'python2' 'python2-numpy' 'swig' 'gcc' 'gcc-fortran' 'openmpi' 'perl' 'blas' 'lapack' 'cmake' 'libmatio' 'netcdf' 'ccache')
# gcc-fortran gcc-fortran-multilib
md5sums=('SKIP')
options=('ccache')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long | sed -e 's/root-of-trilinos-release-//' -e 's/branch-//' -e 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"

  find ${srcdir}/${_pkgname} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

  [[ -e build ]] && rm -rf build
  mkdir build
  cd build

  cmake .. \
      -DTrilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
      -DTrilinos_ENABLE_FEI=OFF \
      -DTrilinos_ENABLE_STKClassic=OFF \
      -DTrilinos_ENABLE_SEACAS=ON     \
      -DTrilinos_ENABLE_Sundance=OFF \
      -DTrilinos_ENABLE_TESTS=OFF \
      -DTrilinos_ENABLE_OpenMP:BOOL=ON \
      -DTPL_ENABLE_MPI:BOOL=ON \
      -DTrilinos_ENABLE_PyTrilinos:BOOL=ON \
      -DPyTrilinos_DOCSTRINGS:BOOL=OFF \
      -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DTPL_ENABLE_Netcdf=ON          \
      -DTPL_ENABLE_QT=OFF              \
      -DTPL_ENABLE_GLM=OFF              \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      $EXTRA_ARGS

  make
}

check() {
    cd $srcdir/${_pkgname}/build
    ctest
}

package() {
    cd $srcdir/${_pkgname}/build
    make install DESTDIR=$pkgdir
}
