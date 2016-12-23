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
pkgver=r72712.5ed03bf9ef
pkgrel=1
pkgdesc="An effort to develop algorithms and enabling technologies within an object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems."
arch=('i686' 'x86_64')
url="https://github.com/trilinos/Trilinos"
license=('LGPL3')
depends=('lapack' 'openmpi' 'python2' 'boost')
provides=('trilinos')
conflicts=('trilinos' 'gtest')
source=(git+${url}.git)
makedepends=('git' 'python2' 'python2-numpy' 'swig' 'gcc' 'gcc-fortran' 'openmpi' 'perl' 'blas' 'lapack' 'cmake' 'libmatio' 'netcdf')
# gcc-fortran gcc-fortran-multilib
md5sums=('SKIP')
options=('ccache')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"

  find ${srcdir}/${_pkgname} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

  sed -i 's#SWIG_VERSION_CEILING 2.0.8#SWIG_VERSION_CEILING 3.0.2#' \
      ${srcdir}/${_pkgname}/packages/PyTrilinos/CMakeLists.txt

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
      -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
      -DCMAKE_INSTALL_PREFIX:PATH=/opt/trilinos \
      -DTPL_ENABLE_Netcdf=ON          \
      -DTPL_ENABLE_QT=OFF              \
      -DTPL_ENABLE_GLM=OFF              \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      $EXTRA_ARGS

  make
}

package() {
    cd $srcdir/${_pkgname}/build
    make install DESTDIR=$pkgdir

    mkdir -p "${pkgdir}/etc/profile.d"
    echo "export TRILINOS_DIR=/opt/trilinos" > "${pkgdir}/etc/profile.d/trilinos.sh"
    chmod +x "${pkgdir}/etc/profile.d/trilinos.sh"
}
