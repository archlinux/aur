# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=petsc-git
pkgver=20191031
pkgrel=1
_config=linux-c-opt
pkgdesc="Portable, extensible toolkit for scientific computation"
provides=(petsc)
conflicts=(petsc)
arch=('i686' 'x86_64')
url="https://www.mcs.anl.gov/petsc/"
license=('BSD')
depends=('python2' 'openmpi' 'boost' 'lapack' 'fftw' 'hdf5')
makedepends=('gcc' 'gcc-fortran' 'cmake')
install=petsc.install
source=(petsc::git+https://gitlab.com/petsc/petsc#branch=maint
        patch.diff)
sha256sums=('SKIP'
            'fdf016437dd94f33316e734e35858476aeea1ca0f3ab4d0ee36029b016498de7')

_petsc_arch="arch-${_config}"


pkgver() {
  cd petsc
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}


prepare() {
  # force using python2
  MATCH='\(/usr/bin/env\|/usr/bin/\)python[[:digit:].]*'
  while IFS= read file; do
    sed -i "s#$MATCH#\\1python2#" "$file"
  done < <( find ${srcdir} -name "*" -type f -exec grep -le "$MATCH" \{\} + )

  cd "${srcdir}/petsc"
  patch -p1 < ../patch.diff
}


build() {
  cd petsc

  CONFOPTS='--with-shared-libraries=1 --COPTFLAGS=-O3 --CXXOPTFLAGS=-O3 --with-cxx-dialect=C++11 --with-mpi=1 --with-fftw=1 --with-hdf5=1 --with-zlib=1'

  # if --with-debugging=1 is set then PETSC_ARCH is automatically set to
  # "linux-c-debug" for some things, so _config should be changed to "linux-c-debug"
  #CONFOPTS="${CONFOPTS} --with-debugging=1"

  # Removed pastix due to incompatibility with current MPI (2019-10-31)
  for external_pkg in amd eigen hypre metis mumps parmetis party ptscotch scalapack suitesparse sundials superlu superlu_dist
  do
    CONFOPTS="${CONFOPTS} --download-${external_pkg}=1"
  done

  export PETSC_DIR="${srcdir}/petsc"
  export PETSC_ARCH="${_petsc_arch}"

  python2 ./configure LDFLAGS="$LDFLAGS" --prefix=/opt/petsc/${_config} ${CONFOPTS}

  make all
}


package() {
  cd petsc

  _build_dir="${srcdir}/petsc"
  _install_dir=/opt/petsc/${_config}

  export PETSC_DIR=${_build_dir}
  export PETSC_ARCH="${_petsc_arch}"

  make DESTDIR="${pkgdir}" install

  # documentation
  # Note: the hyperlinks between documentation, tutorials and examples are
  # not perfect yet
  #mkdir -p ${pkgdir}/usr/share/doc/petsc/
  #cp -r ${_build_dir}/docs ${pkgdir}/usr/share/doc/petsc/

  # src for tutorials
  #find ./src -path '*examples*' -type f -exec \
  #  install -Dm 644 "{}" "${pkgdir}/usr/share/doc/petsc/{}" \;

  # html versions of header files
  #mkdir -p ${pkgdir}/usr/share/doc/petsc/include
  #cp -r ${_build_dir}/include/*.html ${pkgdir}/usr/share/doc/petsc/include/

  # install licence (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export PETSC_DIR=${_install_dir}" > "${pkgdir}/etc/profile.d/petsc.sh"
  chmod +x "${pkgdir}/etc/profile.d/petsc.sh"

  # show where the shared libraries are
  install -dm 755 "${pkgdir}/etc/ld.so.conf.d/"
  echo "${_install_dir}/lib" > "${pkgdir}/etc/ld.so.conf.d/petsc.conf"

	sed -i "s#-L${_build_dir}/${_petsc_arch}/lib ##" "${pkgdir}${_install_dir}/lib/pkgconfig/PETSc.pc"
  sed -i \
    -e "s#prefix=.*#prefix=${_install_dir}#" \
    -e "s#libdir=.*#libdir=\${prefix}/lib#" \
    -e "s#includedir=.*#includedir=\${prefix}/include#" \
    "${pkgdir}${_install_dir}/lib/pkgconfig/superlu.pc"
  sed -i \
    -e "s#prefix=.*#prefix=${_install_dir}#" \
    -e "s#libdir=.*#libdir=\${prefix}/lib#" \
    -e "s#includedir=.*#includedir=\${prefix}/include#" \
    "${pkgdir}${_install_dir}/lib/pkgconfig/superlu_dist.pc"
  sed -i \
    -e "s#prefix=.*#prefix=${_install_dir};#" \
    -e "s#libdir=.*#libdir=\${prefix}/lib;#" \
    "${pkgdir}${_install_dir}/lib/petsc/bin/sundials-config"

  # install pkgconfig settings
  #install -Dm 644 "${_build_dir}/${_petsc_arch}/lib/pkgconfig/PETSc.pc" "${pkgdir}/usr/share/pkgconfig/PETSc.pc"
}
