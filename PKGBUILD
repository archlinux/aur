# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
pkgver=3.20.2
pkgrel=1
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
depends=('python-numpy' 'openmpi' 'boost' 'lapack')
makedepends=('gcc' 'gcc-fortran' 'cmake' 'cython')
provides=('petsc4py')
optdepends=('trilinos: support for trilinos'
  'fftw: support for the FFTW'
  'hdf5: support for the HDF5'
  'hypre: support for the HYPRE'
  'metis: support for METIS'
  'mumps: support for MUMPS'
  'parmetis: support for ParMETIS'
  'scalapack: support for ScaLAPACK'
  'scotch: support for Scotch'
  'suitesparse: support for SuiteSparse'
  'superlu: support for SuperLU'
  'superlu_dist: support for SuperLU_DIST',
  'triangle: support for Triangle'
  'trilinos: support for the ML package from Trilinos'
  )

install=petsc.install
source=(http://web.cels.anl.gov/projects/petsc/download/release-snapshots/${pkgname}-${pkgver}.tar.gz
        test_optdepends.sh)
sha512sums=('16315a0f34982ac5e95d86b6e70d6a47be38b57cc1abf98c368f965cdb569039eaa8ce88447997461656b44fcccbbcf45e8846a9b4245bc942f6f30fc6dd2305'
            '6fff53b92426672655e357938526e62a5636d96ba27ee5c34df3c5045fabcf60855f2f76de30527fab40a866003642f47b7fa164f57077731de9841efdad5b46')

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
            --with-mpi-dir=/usr \
            $(sh ${srcdir}/test_optdepends.sh)"

  echo ${CONFOPTS}
  python ./configure --prefix=${_install_dir} ${CONFOPTS} \
                     --COPTFLAGS='-O3 -march=native' --CXXOPTFLAGS='-O3 -march=native' --FOPTFLAGS='-O3 -march=native'

  make ${MAKEFLAGS} all
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
