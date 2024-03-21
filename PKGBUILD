# Contributor: Michele Mocciola <mimocciola@yahoo.com>
_base=tfel-mfront
_upstream=tfel
pkgname=${_base}-git
pkgver=20240222.r2750.0459fabae
pkgrel=3
pkgdesc="TFEL/MFront introduce DSLs based on C++ to handle material knowledge"
arch=(x86_64)
url="https://github.com/thelfer/${_upstream}"
license=(GPL3)
depends=(gcc-libs gnuplot boost boost-libs python python-numpy)
provides=(tfel mfront=5.0.0 ${_base}=5.0.0)
makedepends=(cmake gcc-fortran)
optdepends=(calculix)
source=(${_base}::git+${url}#branch=master)
sha512sums=('SKIP')

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

safe_flags="-Wp,-D-FORTIFY-SOURCE=2,-D_GLIBCXX_ASSERTIONS"
safe_flags+=" -fcf-protection -fno-plt"
safe_flags+=" -fstack-clash-protection -Wformat"
safe_flags+=" -Werror=format-security"
generic_flags="-march=native -mtune=native"
generic_flags+=" -pipe -fno-plt -fPIC -fopenmp"
generic_flags+="${safe_flags}"
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

export LANG=en_IE.UTF-8
export LC_ALL=en_IE.UTF-8

pkgver() {
  cd "${srcdir}"/"${_base}"
  printf "%s.r%s.%s" \
         "$(git log -1 --format=%cs | tr -d '-')" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C "${srcdir}"/"${_base}" clean -dfx

  # c++: warning: switch ‘-fcheck-pointer-bounds’ is no longer supported
  sed -i 's/^\([[:space:]]*\)\(.*check-pointer-bounds.*\)/# \1\2/g' \
      "${srcdir}"/"${_base}"/cmake/modules/gcc.cmake
}

build() {
  CONFOPTS=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -Denable-python=ON
    -Denable-python-bindings=ON
    -Denable-numpy-support=ON
    -Dinstall-system-libraries=ON
    -Denable-fortran=ON
    -Denable-aster=OFF
    -Denable-abaqus=OFF
    -Denable-ansys=OFF
    -Denable-europlexus=OFF
    -Denable-zmat=OFF
    -Denable-cyrano=OFF
    -Denable-calculix=ON
    -Denable-comsol=OFF
    -Denable-diana-fea=OFF
    -Denable-lsdyna=OFF
    -Denable-reference-doc=OFF
    -Denable-doxygen-doc=OFF
    -Denable-mfront-quantity-tests=ON
    -Denable-testing=ON
    # Takes forever on my machine (killed after 30 minutes)
    # [ 95%] Building CXX object mfront/src/CMakeFiles/TFELMFront.dir/MFrontHeader.o
    # -Denable-sanitize-options=ON
    -Denable-sanitize-options=OFF
    -Wno-dev
    -S "${srcdir}"/"${_base}"
    -B "${srcdir}"/build
  )
  cmake ${CONFOPTS[@]}
  make -C "${srcdir}"/build
}

# # Enable if you want, but:
# #   100% tests passed, 0 tests failed out of 6642
# check() {
#   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/build/lib/" make -C "${srcdir}"/build check
# }

package() {
  # DESTDIR="${pkgdir}" cmake --build "${srcdir}"/"${_base}"/build --target install
  make -C "${srcdir}"/build DESTDIR="${pkgdir}" install
  install -Dm 644 ${_base}/LICENCE-GNU-GPL -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
