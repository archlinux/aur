# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: eDgar <edgar@openmail.cc>
# Based on AUR petsc and petsc-git package.
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Contributor: Martin Diehl <aur@martin-diehl.net>

_base=petsc
pkgname=${_base}-git
pkgver=3.21.1.r89.g70699e4d17e
pkgrel=1
_config=linux-c-opt
# if --with-debugging=yes is set then PETSC_ARCH is automatically set to
#"linux-c-debug" for some things, so the _config should be changed too
#_config=linux-c-debug
pkgdesc="Portable, extensible toolkit for scientific computation"
arch=(i686 x86_64)
url="https://${_base}.org"
license=(BSD-2-Clause)
options=(staticlibs)
depends=(hdf5-openmpi fftw-openmpi gsl lapack libjpeg-turbo libyaml netcdf-openmpi
  python-numpy python-mpi4py superlu suitesparse zlib)
makedepends=(cmake cython gcc gcc-fortran python-setuptools git)
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
source=(git+https://gitlab.com/${_base}/${_base}.git#branch=release
  test_optdepends.sh)
sha512sums=('SKIP'
  'e45df388b373b5f8c86567f32f0d79ae275a855a7fd3b4bb9c03d6875351633d4064de701644a4aa2f9eff90d63806f714230298149868b2f6d92a4f21e20cb8')
conflicts=("${_base}")
provides=("${_base}=${pkgver%%.r*}" "${_base}4py=${pkgver%%.r*}")
install=${_base}.install

_install_dir="/usr"

#  From UPC: Building And Using Static And Shared "C"
#  Libraries.html
# #+begin_QUOTE
# we need that all jump calls ("goto", in assembly speak)
# and subroutine calls will use relative addresses, and not
# absolute addresses. Thus, we need to use ... ~-fPIC~ or
# ~-fpic~
# #+end_QUOTE
#
#  From makepkg.conf
# -march (or -mcpu) builds exclusively for an architecture
# -mtune optimizes for an architecture, but builds for
#  whole processor family
#
# -O3 optimises
#
# -D-FORTIFY-SOURCE=2
# | https://stackoverflow.com/a/16604146
# |- man 7 feature_test_macros
# checks to be performed to detect some buffer overflow
# errors when employing various string and memory
# manipulation functions ... some  conforming programs
# might fail
#
# -fcf-protection
# | Info pages for gcc (gnu compiler collection)
# intended to protect against such threats as
# Return-oriented Programming (ROP), and similarly
# call/jmp-oriented programming (COP/JOP)
#
# -pipe
# | Info pages for gcc (controlling the kind of output)
# Use pipes rather than temporary files for communication
# between the various stages of compilation
#
# -fno-plt
# | Info pages for gcc (code generation conventions)
# leads to more efficient code by eliminating PLT stubs and
# exposing GOT loads to optimizations
#
# -fopenmp
# | Info pages for gcc (controlling c dialect)
# Enable handling of OpenMP directives
#

safe_flags="-Wp,-D-FORTIFY-SOURCE=2,-D_GLIBCXX_ASSERTIONS"
safe_flags+=" -fcf-protection -fno-plt"
safe_flags+=" -fstack-clash-protection -Wformat"
safe_flags+=" -Werror=format-security"
generic_flags="-pipe -fno-plt -fPIC -fopenmp"
generic_flags+=" -march=native"
generic_flags+=" -mtune=native ${safe_flags}"
opt_flags="${generic_flags} -O3"
generic_flags="${generic_flags} -O2"

export LANG=C
unset PETSC_DIR
export PETSC_ARCH=${_config}

pkgver() {
  cd "${srcdir}"/"${_base}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  CONFOPTS=(
    --silent --enable-silent-rules
    --ignoreWarnings=1
    --prefix="${_install_dir}"
    --COPTFLAGS="${opt_flags}"
    --CXXOPTFLAGS="${opt_flags}"
    --FOPTFLAGS="${opt_flags}"
    --CFLAGS="${generic_flags}"
    --CXXFLAGS="$generic_flags"
    --CPPFLAGS="$generic_flags"
    --FCFLAGS="$generic_flags"
    --F90FLAGS="$generic_flags"
    --FFLAGS="$generic_flags"
    --MAKEFLAGS=${MAKEFLAGS}
    --LDFLAGS=${LDFLAGS}
    --with-environment-variables=1
    --with-cxx-dialect=auto
    --with-mpi=1
    --with-pic=1
    --with-shared-libraries=1
    --with-zlib=1
    --with-petsc4py=1
    --with-scalar-type=complex
    --with-single-library=1
    " $(sh ${srcdir}/test_optdepends.sh)")

  cd "${srcdir}"/"${_base}"
  export PETSC_DIR="${srcdir}"/"${_base}"
  python ./configure ${CONFOPTS[@]}
  make -s ${MAKEFLAGS} all
  make DESTDIR=${srcdir}/tmp install
}

# check() {
#   cd "${srcdir}"/"${_base}"
#   PETSC_DIR="${srcdir}"/"${_base}" PYTHONPATH="${srcdir}/tmp/${_install_dir}/lib:${PYTHONPATH}" make check
#   exit
# }

package() {
  # # From OpenCV (hack destination of petsc4py)
  # _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  # sed -i "s%\(installLibPath = \)os.path.join(self.installDir, 'lib')%\1'${_pythonpath}'%"
  unset PETSC_DIR
  _build_dir="${srcdir}"/"${_base}"

  make -C "${_build_dir}" \
    ${MAKEFLAGS} DESTDIR="${pkgdir}" install

  export PETSC_DIR=${_install_dir}

  # install licence (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE \
    "${pkgdir}"/"${_install_dir}"/share/licenses/"${pkgname}"/LICENSE

  mkdir -p "${pkgdir}"/etc/profile.d
  echo "export PETSC_DIR=${_install_dir}" > \
    "${pkgdir}"/etc/profile.d/${_base}.sh
  # echo "export PYTHONPATH=\$PYTHONPATH:/${_install_dir}/${_base}/${_config}/lib" \
  #      >> "${pkgdir}"/etc/profile.d/${_base}.sh
  chmod +x "${pkgdir}"/etc/profile.d/${_base}.sh

  # show where the shared libraries are
  install -dm 755 "${pkgdir}"/etc/ld.so.conf.d/
  echo "${_install_dir}/lib" > \
    "${pkgdir}"/etc/ld.so.conf.d/${_base}.conf

  # install pkgconfig settings
  install -Dm 644 "${_build_dir}/${_config}"/lib/pkgconfig/PETSc.pc \
    "${pkgdir}"/"${_install_dir}"/share/pkgconfig/PETSc.pc

  # cd "${srcdir}"/"${_base}"/src/binding/petsc4py
  # CFLAGS="$(echo "${CFLAGS}" | sed 's%-D[^[:space:]]*%%g')" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  # cd -
  _pythonpath="${pkgdir}"/$(python -c "from sysconfig import get_path; print(get_path('platlib'))")
  install -dm 755 ${_pythonpath}
  ln -s "${_install_dir}"/lib/petsc4py ${_pythonpath}
}
