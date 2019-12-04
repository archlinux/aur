# Maintainer: Martin Diehl  <m dot diehl at mpie dot de>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
pkgname=petsc
pkgver=3.12.2
pkgrel=2
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
  'ptscotch: support for ptscotch parallel graph partitioning library'
  'parmetis: support for parmetis parallel graph partitioning library'
  'metis: support for metis graph partitioning library'
  'pastix: support for the pastix solver'
  'superlu: support for the superlu sparse solver'
  'hypre: support for the hypre sparse system solver'
  'hdf5: support for the parallel version of hdf5'
  'mumps: support for the mumps sparse solver'
  'fftw: support for the fftw fast Fourier transform'
  'suitesparse: support for the suitesparse sparse matrix libraries'
  )
install=petsc.install
source=(http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/${pkgname}-lite-${pkgver/_/-}.tar.gz
        test_optdepends.sh)
sha256sums=('c30bf8a005e850d1db137b7807a1b780286f70e650e5eba251061133ebd27f63'
            'f127806175b681f4e9cb64aeba4f3fabd9eb92ef945f5542677b255cb3d85913')

_install_dir=/opt/petsc/${_config}
_petsc_arch="arch-${_config}"

# to avoid: "make[2]: *** No rule to make target `libptesmumps.a', needed by `main_esmumps'.  Stop."
export MAKEFLAGS="-j1"

prepare() {
  _build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

  # install external libraries in _build_dir instead of the prefix
  sed -i 's/self.publicInstall    = 1/self.publicInstall    = 0/' ${_build_dir}/config/BuildSystem/config/package.py
}

build() {
  _build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

  cd ${_build_dir}

  unset PETSC_ARCH
  export PETSC_DIR=${_build_dir}

  CONFOPTS="--with-shared-libraries=1 --COPTFLAGS=-O3 --CXXOPTFLAGS=-O3"

  # test for the optional dependencies for petsc
  CONFOPTS="${CONFOPTS} $(sh ${srcdir}/test_optdepends.sh)"

  # to enable use of type()
  #CONFOPTS="${CONFOPTS} --with-fortran-datatypes --FOPTFLAGS=-O2"

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

  make test
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
  #mkdir -p "${pkgdir}"/usr/share/pkgconfig
  install -Dm 644 "${_build_dir}/${_petsc_arch}"/lib/pkgconfig/PETSc.pc "${pkgdir}"/usr/share/pkgconfig/PETSc.pc
}
