# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
pkgver=3.20.3
pkgrel=5
pkgname=petsc
_config=linux-c-opt
# if --with-debugging=yes is set then PETSC_ARCH is automatically set to
#"linux-c-debug" for some things, so the _config should be changed too
#_config=linux-c-debug
pkgdesc="Portable, extensible toolkit for scientific computation"
arch=('i686' 'x86_64')
url="https://petsc.org"
license=('BSD')
options=(staticlibs)
# note: zlib is not really needed by PETSc, but netcdf requires an HDF5 version with zlib
depends=('openmpi' 'lapack' 'hdf5-openmpi' 'fftw' 'superlu' 'suitesparse' 'libyaml' 'gsl' 'libjpeg-turbo' 'netcdf-openmpi' 'zfp' 'zlib'
         'python-numpy' 'python-mpi4py')
makedepends=('gcc' 'gcc-fortran' 'cmake' 'cython')
provides=('petsc4py')
optdepends=('trilinos: support for trilinos'
  'hypre: support for HYPRE'
  'kokkos: support Kokkos'
  'metis: support for METIS'
  'mumps: support for MUMPS'
  'parmetis: support for ParMETIS'
  'scalapack: support for ScaLAPACK'
  'scotch: support for Scotch'
  'superlu_dist: support for SuperLU_DIST'
  'triangle: support for Triangle'
  'trilinos-ml: support for ML (part of Trilinos)'
  'zoltan: support for zoltan'
  )

install=petsc.install
source=(http://web.cels.anl.gov/projects/petsc/download/release-snapshots/${pkgname}-${pkgver}.tar.gz
        test_optdepends.sh)
sha512sums=('912538850eeaf6d78c090438f8198963cd787ef7ff3bbc841719b08fc738c7b20b7955850baacca4eada4a97b113492b9111d35afa33918ec52123e2f1a73f9b'
            '13e1c625e12ff8a701bf91f4bf5aa7cfe4766821feab32314b2dbf48a2f26c0ea85586e18c3e72a55c4f26c21bb8675896ee0ddd60a9f06cb68814a03d6057ea')

_install_dir=/opt/petsc/${_config}
_petsc_arch=arch-${_config}


build() {
  _build_dir=${srcdir}/${pkgname}-${pkgver}
  cd ${_build_dir}

  export PETSC_ARCH=${_petsc_arch}
  export PETSC_DIR=${_build_dir}

  CONFOPTS="--with-shared-libraries=1 \
            --with-petsc4py=1 \
            --with-mpi-f90module-visibility=0 \
            --with-bison=0 \
            --with-cmake=0 \
            --with-mpi-dir=/usr \
            --with-zfp=1 \
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
            $(sh ${srcdir}/test_optdepends.sh)"

  echo './configure' ${CONFOPTS}
  echo 'CFLAGS='${CFLAGS}
  echo 'CXXFLAGS='${CXXFLAGS}
  echo 'FFLAGS='${FFLAGS}
  echo 'LDFLAGS='${LDFLAGS}
  echo 'MAKEFLAGS='${MAKEFLAGS}

  ./configure --prefix=${_install_dir} ${CONFOPTS} \
              "CFLAGS=$CFLAGS" \
              "CXXFLAGS=$CXXFLAGS" \
              "FFLAGS=$FFLAGS" \
              "LDFLAGS=$LDFLAGS" \
              "MAKEFLAGS=$MAKEFLAGS"

  make all
  make DESTDIR=${srcdir}/tmp install
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}

  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  export OMPI_MCA_plm_rsh_agent=sh
  PYTHONPATH=${srcdir}/tmp/${_install_dir}/lib:${PYTHONPATH} make check
}

package() {
  _build_dir=${srcdir}/${pkgname}-${pkgver}


  mkdir -p ${pkgdir}/${_install_dir}
  cp -Hr ${srcdir}/tmp/* ${pkgdir}

  # install licence (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

  mkdir -p ${pkgdir}/etc/profile.d
  echo export PETSC_DIR=${_install_dir} > ${pkgdir}/etc/profile.d/petsc.sh
  echo export PYTHONPATH=${_install_dir}/lib:'${PYTHONPATH}' >> ${pkgdir}/etc/profile.d/petsc.sh
  chmod +x ${pkgdir}/etc/profile.d/petsc.sh

  # show where the shared libraries are
  install -dm 755 ${pkgdir}/etc/ld.so.conf.d/
  echo ${_install_dir}/lib > ${pkgdir}/etc/ld.so.conf.d/petsc.conf

  # install pkgconfig settings
  install -Dm 644 ${_build_dir}/${_petsc_arch}/lib/pkgconfig/PETSc.pc ${pkgdir}/usr/share/pkgconfig/PETSc.pc
}
