# Maintainer: entschuld <edgr@openmail.cc>

pkgname=fenics-basix-git
_realname=basix
pkgdesc="C++ interface of FEniCS for ordinary and partial differential equations."
pkgver=0.1.0.25.g970087e
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/basix"
license=('GPL3')
groups=('fenics-git')
depends=('xtensor' 'xtensor-blas' 'pybind11' 'petsc')
makedepends=('git' 'boost')
options=(!emptydirs)
source=("git+${url}")
md5sums=('SKIP')
_mainver=$(printf ${pkgver} | cut -d'.' -f1,2,3)
provides=("${_realname}=$_mainver" "python-${_realname}=$_mainver"
          "python-${_realname}-git=$_mainver")
replaces=("${_realname}" "python-${_realname}"
"python-${_realname}-git")
conflicts=("${_realname}" "python-${_realname}"
"python-${_realname}-git")

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
  cd "${srcdir}/${_realname}"
  pkgrel=$(git describe --tags --match '*.*' | awk -F'-' '{print $2"."$3}')
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh

  cmake -DCMAKE_BUILD_TYPE=Release \
        -B "${srcdir}"/build \
        -S "${srcdir}"/"${_realname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH="${srcdir}"/build \
        -DXTENSOR_OPTIMIZE=TRUE \
        -DCMAKE_SKIP_BUILD_RPATH=TRUE \
        -DCMAKE_SKIP_RPATH=TRUE \
        -DCMAKE_BUILD_TYPE="Release" \
        -Dxtensor_DIR=\
        "$(pacman -Ql xtensor |
                   awk '/xtensorConfig\.cmake/{print $NF}')"
  cmake --build "${srcdir}"/build
}

package() {
  cd "${pkgdir}"
  make -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  cd "${srcdir}"/"${_realname}"/python
  sed -i "s%\(find_package(Basix.*\)%set(CMAKE_PREFIX_PATH \"${pkgdir}/usr/lib/cmake/basix\")\n\1%" "${srcdir}"/"${_realname}"/python/CMakeLists.txt
  python setup.py build
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
