# Based on AUR petsc and petsc-git package.

# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Contributor: Martin Diehl <aur@martin-diehl.net>

_base=petsc
pkgname=("${_base}"-git "${_base}"-doc)
pkgver=3.15.5
pkgrel=1
_mainver="${pkgver:0:6}"
pkgdesc="Portable, extensible toolkit for scientific computation"
arch=('i686' 'x86_64')
url="https://gitlab.com/petsc/${_base}"
license=('BSD')
options=(!staticlibs)
depends=('openmpi' 'lapack' 'fftw' 'zlib' 'cython'
         'python-mpi4py' "python-numpy" "eigen>=3" "openblas")
makedepends=('gcc' 'gcc-fortran' 'cmake' 'sowing' "pkgconf"
             'git' 'cython' 'chrpath' "hypre=2.18.2")
source=(git+${url}.git#branch=release
        https://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-with-docs-"${_mainver}".tar.gz
        test_optdepends.sh
        so.diff)
sha512sums=('SKIP'
            'd6be4488cb5dad9f7928e0966b875f83d4b84a0fd8553fcc9912aed1b7f1fcd3922ec282c30dc8cb0b424e8375b437fe50ce84b76c9c8a28c51efd954f6ed001'
            'e45df388b373b5f8c86567f32f0d79ae275a855a7fd3b4bb9c03d6875351633d4064de701644a4aa2f9eff90d63806f714230298149868b2f6d92a4f21e20cb8'
            'e79a4a070df882d8cbf302c1b8732fc2fea907cd5bc5c429e4ff4919e45ffef1a0b7abe578c5942bf44bbb34bcabed70029f4f6403fee23b7da3ca7cce29edb4')

_config=linux-c-opt
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
export OMPI_MCA_opal_cuda_support=0
export OMPI_MCA_mpi_oversubscribe=0
unset PETSC_DIR
export PETSC_ARCH=${_config}

prepare() {
  patch -p1 -d "${srcdir}"/"${_base}" -i "${srcdir}"/so.diff
}

pkgver() {
  cd "${srcdir}"/"${_base}"
  git describe --tags --match '*.*' | tr '-' '.' | sed 's-^v--'
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
  python ./configure ${CONFOPTS[@]}
  make -s ${MAKEFLAGS} all
  # MPIEXEC="$(which mpiexec) --nooversubscribe" make -s ${MAKEFLAGS} all
}

check() {
  cd "${srcdir}"/"${_base}"
  make check
  }

package_petsc-git() {
  optdepends=(
    "boost: Free peer-reviewed portable C++ source libraries"
    "cgns: Recording and recovering computer data"
    "eigen: Lightweight C++ template library for vector and matrix math"
    "fftw: Fast-Fourier Transform"
    "gdb: Debugging"
    "hdf5: large files"
    "hwloc: Portable Hardware Locality (abstraction of hierarchical architectures)"
    "med>=4.0: Data Modelization and Exchanges (meshes)"
    "metis: Partitioning library (for meshes)"
    "mumps: Sparse solver library"
    "openblas: Linear algebra libraries"
    "opencl-headers: for opencl (GPU computing)"
    "opencl: GPU computing"
    "openmp: Parallel distributed tasks"
    "libpng"
    "scalapack: Parallel memory linear algebra"
    "scotch: Partitioning with sparse matrices"
    "suitesparse: Sparse matrix library"
    "superlu: Subroutines for sparsse linear systems"
    "libyaml: configuration files")
  provides=(${_base}="${_mainver}" petsc4py="${_mainver}")
  conflicts=(${_base})

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
  _pythonpath="${pkgdir}"/`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  install -dm 755 ${_pythonpath}
  ln -s "${pkgdir}"/"${_install_dir}"/lib/petsc4py ${_pythonpath}
}

package_petsc-doc () {
  depends=()
  optdepends=()
  provides=(${_base}-doc)
  replaces=(${_base}-doc)
  conflicts=()
  pkgdesc="Documentation for PETSc"
  # Two options: compile the documentation or get it from
  # the web. Downloading is easier.
  [[ -d ${pkgdir}/${_install_dir}/share/doc ]] && \
    rm -fr "${pkgdir}"/"${_install_dir}"/share/doc
  mkdir -p "${pkgdir}"/"${_install_dir}"/share/doc
  cp -r "${srcdir}/${_base}-${_mainver}/docs" \
     "${pkgdir}"/"${_install_dir}"/share/doc/${_base}
}
