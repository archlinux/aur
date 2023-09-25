# Maintainer: entschuld < edgar -a t . openmail.cc>

pkgname=fenics-basix-git
_base=basix
pkgdesc="Interface of FEniCS for ordinary and partial differential equations (C++ and Python from git release)."
pkgver=0.6.0
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/basix"
license=('MIT')
groups=('fenics-git')
depends=('xtensor' 'xtensor-blas' 'petsc' "python-numpy" "blas-openblas")
makedepends=('git' 'boost' 'python-setuptools' "pybind11" "gcc")
checkdepends=("python-sympy")
options=(!emptydirs)
source=("git+${url}#branch=release"
        "0001-local-build-for-Python.patch")
sha512sums=('SKIP'
            '68798ec16666289131bec093a9b5f762569f2dbc9fa6d537dc5d9573abb6faa07791091cf4f12f2ce41798cd8e8b506311be3f2f55ce63cc28e3f91586a7b549')

provides=("${_base}=${pkgver}"
          "python-${_base}=${pkgver}"
          "python-${_base}-git=${pkgver}"
          "python-fenics-${_base}=${pkgver}")
replaces=("${provides//$_mainver/}")
conflicts=("${_base}"
          "python-${_base}"
          "python-${_base}-git"
          "python-fenics-${_base}")
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

safe_flags="-Wp,-D_FORTIFY_SOURCE=2,-D_GLIBCXX_ASSERTIONS"
safe_flags+=" -fcf-protection -fno-plt"
safe_flags+=" -fstack-clash-protection -Wformat"
safe_flags+=" -Werror=format-security"
generic_flags="-pipe -fno-plt -fPIC -fopenmp"
generic_flags+=" -march=native"
generic_flags+=" -mtune=native ${safe_flags}"
opt_flags="${generic_flags} -O3"
generic_flags="${generic_flags} -O2"

export COPTFLAGS="${opt_flags}"
export CXXOPTFLAGS="$COPTFLAGS"
export FOPTFLAGS="$COPTFLAGS"
export CPPFLAGS="$generic_flags"
export CXXFLAGS="$CPPFLAGS"
export CFLAGS="$generic_flags"
export FFLAGS="$generic_flags"
export FCFLAGS="$generic_flags"
export F90FLAGS="$generic_flags"
export F77FLAGS="$generic_flags"

export CC=mpicc
export CXX=mpicxx
export FC=mpif90
export F90=mpif90

export LANG=en_IE.UTF-8
export LC_ALL=en_IE.UTF-8

_base_dir="${startdir}"/src/"${_base}"

prepare() {
  git -C "${_base_dir}" clean -dfx
  # Manually add
  # #include <cstdint> to src/basix/cpp/basix/finite-element.h
}

pkgver() {
  cd "${_base_dir}"
  _gitver=$(git describe --tags --match '*.*' | tr '-' '.')
  # # Gets the version from setup.py
  # # (prototype: version='0.5.1.dev0')
  # _pyver=$(grep 'version=' \
  #                "${srcdir}"/"${_base}"/python/setup.py |
  #            tr -d ",'" | cut -d"=" -f2)
  # printf "%s.%s" "$_pyver" "$_gitver"
  printf "%s" "${_gitver##v}"
}

build() {
  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh

  cmake -DCMAKE_BUILD_TYPE="Release" \
        -B "${srcdir}"/build \
        -S "${_base_dir}" \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "${srcdir}"/build
}

# check() {
#   cd "${_base_dir}"
#   pytest test
# }

package() {
  # cd "${srcdir}"/"${_base}"/cpp
  cmake --install "${srcdir}"/build --prefix="${pkgdir}"/usr
  # make -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  # export Basix_DIR="${pkgdir}/usr/"
  _pydir="${_base_dir}"/python
  cd "${_pydir}"

  export CMAKE_PREFIX_PATH="${pkgdir}"/usr
  python -m build --wheel --no-isolation --skip-dependency-check

  PYTHONPYCACHEPREFIX="${_pydir}/.cache/cpython/" \
                     python -m installer --destdir="$pkgdir" dist/*.whl
}
