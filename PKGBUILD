# Contributor: Dylon Edwards <deltaecho at archlinux dot us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: haawda
# Maintainer: eDgar <edgar `not@` openmail cc>

pkgname=tetgen
pkgver=1.6.0
pkgrel=4
pkgdesc='A Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator'
arch=('x86_64')
url='http://wias-berlin.de/software/index.jsp?id=TetGen&lang=1'
license=('AGPL3')
#  You must accept the licensing terms before downloading the source archive:
#    http://wias-berlin.de/software/tetgen/download2.jsp
#  Place the downloaded archive in $SRCDEST of your /etc/makepkg.conf
source=("http://wias-berlin.de/software/tetgen/1.6/src/${pkgname}${pkgver}.tar.gz")
sha256sums=('87b5e61ebd3a471fc4f2cdd7124c2b11dd6639f4feb1f941a5d2f5110d05ce39')
options=('!staticlibs')
makedepends=('cmake')

[ ! -f ${pkgname}${pkgver}.tar.gz ] &&
  printf "1. Visit http://wias-berlin.de/software/tetgen/download2.jsp\n" &&
  printf "2. Place the downloaded tar.gz in \$SRCDEST (/etc/makepkg.conf;\n" &&
  printf "   right now SRCDEST=$SRCDEST)\n" &&
  printf "3. When ready, try again.\n" && exit

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

prepare() {
  sed -i 's/tet STATIC/tet SHARED/g' "${pkgname}${pkgver}"/CMakeLists.txt
}

build() {
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  CONFOPTS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE="$CXXOPTFLAGS"
	-DCMAKE_C_FLAGS_RELEASE="$COPTFLAGS"
  )
  cmake ../"${pkgname}${pkgver}"
  make
}

package() {
  cd build
  install -m 755 -D -t "${pkgdir}/usr/bin" tetgen
  install -m 644 -D -t "${pkgdir}/usr/lib" libtet.so
  install -m 644 -D -t "${pkgdir}/usr/include" ../"${pkgname}${pkgver}/tetgen.h"
}
