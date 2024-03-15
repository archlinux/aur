# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Auto update bot <auto-update-bot@jingbei.li>
# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: Sigvald Marholm <marholm@marebakken.com>
# Adapted from the package petsc with the following original contributors:
# Contributor: Martin Diehl <https://martin-diehl.net>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
_base=petsc
pkgname=${_base}-complex
pkgver=3.20.5
pkgrel=2
_config=linux-c-opt
# if --with-debugging=yes is set then PETSC_ARCH is automatically set to
#"linux-c-debug" for some things, so the _config should be changed too
#_config=linux-c-debug
pkgdesc="Portable, extensible toolkit for scientific computation (complex scalars)"
arch=(i686 x86_64)
url="https://${_base}.org"
license=(BSD-2-Clause)
options=(staticlibs)
conflicts=(${_base})
provides=("${_base}=${pkgver}")
depends=(hdf5-openmpi fftw-openmpi gsl lapack libjpeg-turbo libyaml netcdf-openmpi
  python-numpy python-mpi4py superlu suitesparse zlib)
makedepends=(cmake cython gcc gcc-fortran)
checkdepends=()
optdepends=('hypre: support for the hypre sparse system solver'
  'kokkos: support for Kokkos'
  'metis: support for metis graph partitioning library'
  'mumps: support for the mumps sparse solver'
  'parmetis: support for parmetis parallel graph partitioning library'
  'pastix: support for the pastix solver'
  'scalapack: support for ScaLAPACK'
  'scotch: support for Scotch'
  'superlu_dist: support for the superlu_dist sparse solver'
  'triangle: support for the two-dimensional quality mesh generator and Delaunay triangulator'
  'valgrind: support for valgrind to help find memory-management problems in programs'
  'zoltan: support for zoltan')
install=${_base}.install
source=(https://web.cels.anl.gov/projects/${_base}/download/release-snapshots/${_base}-lite-${pkgver}.tar.gz
  test_optdepends.sh)
sha512sums=('1e0ebdacbcc9db22dbe3803cbc13f5e0138d0412c328ff49cab024c839527c73b28983717104daf0858d482a8804b931c5c2bf20363c6b801d2be7d27219692f'
  '1a790c36b1bb6b6604b4fe35f3c7fba2d8f972e7fd3c6ac1273716bee490f4dded18990b9f4aedecbe609aa6ec3d2469d44c013e18ed5cf9a43f5703f2b59db8')

_install_dir=/opt/${_base}/${_config}
_petsc_arch=arch-${_config}

build() {
  _build_dir=${srcdir}/${_base}-${pkgver}
  cd ${_build_dir}

  export PETSC_ARCH=${_petsc_arch}
  export PETSC_DIR=${_build_dir}

  OPTFLAGS='-O3 -march=native'
  CONFOPTS="--with-shared-libraries=1 \
            --with-mpi-f90module-visibility=0 \
            --with-petsc4py=1 \
            --with-mpi-dir=/usr \
            --with-zfp=0 \
            --with-netcdf=1 \
            --with-libjpeg=1 \
            --with-yaml=1 \
            --with-fftw=1 \
            --with-gsl=1 \
            --with-zlib=1 \
            --with-superlu-lib=-lsuperlu --with-superlu-include=/usr/include/superlu \
            --with-suitesparse-include=/usr/include/suitesparse \
            --with-suitesparse-lib=[libamd.so,libbtf.so,libcamd.so,libccolamd.so,libcholmod.so,libcolamd.so,libcxsparse.so,libgraphblas.so,libklu.so,libklu_cholmod.so,liblagraph.so,liblagraphx.so,libldl.so,libparu.so,librbio.so,libspex.so,libspqr.so,libsuitesparse_mongoose.so,libsuitesparseconfig.so,libumfpack.so] \
            --with-hdf5=1 --with-hdf5-fortran-bindings=1 \
            --with-scalar-type=complex \
            $(sh ${srcdir}/test_optdepends.sh)"

  echo ${CONFOPTS}
  python ./configure --prefix=${_install_dir} ${CONFOPTS} \
    --COPTFLAGS=${OPTFLAGS} --CXXOPTFLAGS=${OPTFLAGS} --FOPTFLAGS=${OPTFLAGS}

  make ${MAKEFLAGS} all
  make DESTDIR=${srcdir}/tmp install
}

check() {
  cd ${srcdir}/${_base}-${pkgver}
  PYTHONPATH=${srcdir}/tmp/${_install_dir}/lib:${PYTHONPATH} make check
}

package() {
  _build_dir=${srcdir}/${_base}-${pkgver}

  mkdir -p ${pkgdir}/${_install_dir}
  cp -Hr ${srcdir}/tmp/* ${pkgdir}

  # install licence (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p ${pkgdir}/etc/profile.d
  echo export PETSC_DIR=${_install_dir} >${pkgdir}/etc/profile.d/petsc.sh
  echo export PYTHONPATH=${_install_dir}/lib:'${PYTHONPATH}' >>${pkgdir}/etc/profile.d/petsc.sh
  chmod +x ${pkgdir}/etc/profile.d/petsc.sh

  # show where the shared libraries are
  install -dm 755 "${pkgdir}"/etc/ld.so.conf.d/
  echo ${_install_dir}/lib >${pkgdir}/etc/ld.so.conf.d/petsc.conf

  # install pkgconfig settings
  install -Dm 644 ${_build_dir}/${_petsc_arch}/lib/pkgconfig/PETSc.pc ${pkgdir}/usr/share/pkgconfig/PETSc.pc
}
