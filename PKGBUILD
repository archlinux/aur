# vim:set ts=2 sw=2 et:
# Maintainer: simon.pintarelli@gmail.com
# Contributor: Feng Wang <wanng.fenng@gmail.com>
pkgname=trilinos
pkgver=12.8.1
pkgrel=1
pkgdesc="An effort to develop algorithms and enabling technologies within an object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems."
arch=('i686' 'x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('lapack' 'openmpi' 'python2' 'boost')
source=('git+https://github.com/trilinos/Trilinos.git#tag=trilinos-release-12-8-1')
md5sums=('SKIP')
makedepends=('python2' 'python2-numpy' 'swig' 'gcc' 'gcc-fortran' 'openmpi' 'perl' 'blas' 'lapack' 'cmake')


build() {

  cd "$srcdir/Trilinos"

  find ${srcdir}/Trilinos -path .git -prune -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

  sed -i 's#SWIG_VERSION_CEILING 2.0.8#SWIG_VERSION_CEILING 3.0.10#' \
	${srcdir}/Trilinos/packages/PyTrilinos/CMakeLists.txt

  [[ -e build ]] && rm -rf build
  mkdir build
  cd build

  cmake .. \
        -DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
	-DTrilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
	-DTrilinos_ENABLE_INTREPID:BOOL=OFF \
	-DTrilinos_ENABLE_SEACAS:BOOL=OFF \
	-DTrilinos_ENABLE_Mesquite:BOOL=OFF \
	-DTrilinos_ENABLE_FEI:BOOL=OFF \
        -DTrilinos_ENABLE_Gtest:BOOL=OFF \
        -DTrilinos_ENABLE_Shards:BOOL=OFF \
	-DTrilinos_ENABLE_OpenMP:BOOL=OFF \
        -DTpetra_INST_OpenMP:BOOL=ON \
        -DTPL_ENABLE_gtest:BOOL=ON \
	-DTPL_ENABLE_MPI:BOOL=ON \
        -DTPL_ENABLE_Matio:BOOL=OFF \
	-DTPL_ENABLE_GLM:BOOL=OFF \
	-DTPL_ENABLE_NETCDF:BOOL=OFF \
	-DTPL_ENABLE_X11:BOOL=OFF \
	-DTrilinos_ENABLE_CXX11:BOOL=ON \
	-DTrilinos_ENALBE_PAMGEN:BOOL=OFF \
	-DTrilinos_ENABLE_PyTrilinos:BOOL=ON \
	-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DBUILD_SHARED_LIBS:BOOL=ON \
	-DCMAKE_BUILD_TYPE=Release \
	$EXTRA_ARGS

  make

}

package() {
    cd $srcdir/Trilinos/build
    make install DESTDIR=$pkgdir

    # mkdir -p "${pkgdir}/etc/profile.d"
    # echo "export TRILINOS_DIR=/usr" > "${pkgdir}/etc/profile.d/trilinos.sh"
    # chmod +x "${pkgdir}/etc/profile.d/trilinos.sh"
}
