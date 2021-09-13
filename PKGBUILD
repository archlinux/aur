# Maintainer: entschuld <edgr@openmail.cc>

pkgname=fenics-basix-git
_base=basix
pkgdesc="C++ interface of FEniCS for ordinary and partial differential equations."
pkgver=0.1.0.26.gca5876e
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/basix"
license=('GPL3')
groups=('fenics-git')
depends=('xtensor' 'xtensor-blas' 'pybind11' 'petsc')
makedepends=('git' 'boost')
optdepends=('python-numba')
options=(!emptydirs)
source=("git+${url}")
md5sums=('SKIP')
_mainver=$(printf ${pkgver} | cut -d'.' -f1,2,3)
provides=("${_base}=$_mainver" "python-${_base}=$_mainver"
          "python-${_base}-git=$_mainver")
replaces=("${_base}" "python-${_base}"
"python-${_base}-git")
conflicts=("${_base}" "python-${_base}"
"python-${_base}-git")

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

pkgver() {
  cd "${srcdir}/${_base}"
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh

  cd "${srcdir}"/"${_base}"/cpp
  # Add CBLAS to linking libraries
  # (https://github.com/davisking/dlib/issues/154#issuecomment-240651490)
  sed -i 's%\(target_link_libraries(basix PRIVATE ${BLAS_LIBRARIES})\)%\nset(BLAS_LIBRARIES "-lcblas;-lblas")\n\1%' "${srcdir}"/"${_base}"/cpp/CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE="Release" \
        -B "${srcdir}"/build \
        -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DXTENSOR_OPTIMIZE=TRUE
  cmake --build "${srcdir}"/build
}

package() {
  cd "${srcdir}"/"${_base}"/cpp
  cmake --install "${srcdir}"/build --prefix="${pkgdir}"/usr
  # make -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  cd "${srcdir}"/"${_base}"/python
  python setup.py build
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # pip install . --no-deps --prefix=/usr --root="${pkgdir}" --compile
}
