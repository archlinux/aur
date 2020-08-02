# Maintainer: Martin Diehl <https://martin-diehl.net>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
pkgname=petsc
pkgver=3.13.3
pkgrel=1
_config=linux-c-opt
# if --with-debugging=yes is set then PETSC_ARCH is automatically set to
#"linux-c-debug" for some things, so the _config should be changed too
#_config=linux-c-debug
pkgdesc="Portable, extensible toolkit for scientific computation"
arch=('i686' 'x86_64')
url="https://www.mcs.anl.gov/petsc/"
license=('BSD')
options=(staticlibs)
depends=('python' 'openmpi' 'boost' 'lapack')
makedepends=('gcc' 'gcc-fortran' 'cmake')
optdepends=('trilinos: support for trilinos'
  'ptscotch: support for ptscotch sequential and parallel graph partitioning library'
  'parmetis: support for parmetis parallel graph partitioning library'
  'metis: support for metis graph partitioning library'
  'pastix: support for the pastix solver'
  'superlu: support for the superlu sparse solver'
  'hypre: support for the hypre sparse system solver'
  'hdf5-openmpi: support for the parallel version of HDF5'
  'mumps: support for the mumps sparse solver'
  'fftw: support for the FFTW fast Fourier transform'
  'triangle: support for the two-dimensional quality mesh generator and Delaunay triangulator'
  'suitesparse: support for the suitesparse sparse matrix libraries'
  )
install=petsc.install
source=(http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/${pkgname}-lite-${pkgver/_/-}.tar.gz
        test_optdepends.sh)
sha256sums=('dc744895ee6b9c4491ff817bef0d3abd680c5e3c25e601be44240ce65ab4f337'
            'f67901cec213c346481b6c9a56080dee9ee00a3852e46da9f35e933a11870623')

_install_dir=/opt/petsc/${_config}
_petsc_arch="arch-${_config}"

build() {
  _build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

  cd ${_build_dir}

  unset PETSC_ARCH
  export PETSC_DIR=${_build_dir}

  CONFOPTS="--with-shared-libraries=1 --COPTFLAGS=-O3 --CXXOPTFLAGS=-O3 --FOPTFLAGS=-O3 \
            --with-cc=$(which mpicc) --with-cxx=$(which mpicxx) --with-fc=$(which mpifort)"
  CONFOPTS="${CONFOPTS} $(sh ${srcdir}/test_optdepends.sh)"

  echo ${CONFOPTS}
  python ./configure \
    --prefix=${_install_dir} \
    --PETSC_ARCH=${_petsc_arch} \
    ${CONFOPTS}

  make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_petsc_arch} all
}

check() {
  _build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"
  cd ${_build_dir}

  make check
}

package() {
  _build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

  cd ${_build_dir}
  echo "make ${MAKEFLAGS} PETSC_DIR=${_build_dir} DESTDIR=${pkgdir} install"
  export PETSC_DIR=${_build_dir}
  make ${MAKEFLAGS} PETSC_DIR=${_build_dir} DESTDIR=${pkgdir} install

  export PETSC_DIR=${_install_dir}

  # install licence (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

  mkdir -p ${pkgdir}/etc/profile.d
  echo "export PETSC_DIR=${_install_dir}" > ${pkgdir}/etc/profile.d/petsc.sh
  chmod +x ${pkgdir}/etc/profile.d/petsc.sh

  # show where the shared libraries are
  install -dm 755 "${pkgdir}"/etc/ld.so.conf.d/
  echo "${_install_dir}/lib" > "${pkgdir}"/etc/ld.so.conf.d/petsc.conf

  # install pkgconfig settings
  install -Dm 644 "${_build_dir}/${_petsc_arch}"/lib/pkgconfig/PETSc.pc "${pkgdir}"/usr/share/pkgconfig/PETSc.pc
}
