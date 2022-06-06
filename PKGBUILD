# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=simulavr-git
pkgver=1.1.0.r5.g32985f7
pkgrel=1
pkgdesc='A simulator for the Atmel AVR family of microcontrollers'
arch=('x86_64')
url='https://www.nongnu.org/simulavr/'
license=('GPL2')
depends=()
# Required dependencies for ...
#   core: cmake git python
#   doc: help2man texinfo
#   tcl: tcl swig
#   python: python swig
#   verilog: iverilog
#
# Full documentation requires also:
#   doxygen dot python-sphinx rst2pdf python-beautifulsoup4 python-requests
#
# To run tests: avr-gcc avr-libc valgrind
makedepends=('cmake' 'git' 'help2man' 'iverilog' 'python' 'swig' 'tcl' 'texinfo')
provides=('simulavr')
conflicts=('simulavr')
source=("${pkgname}::git+https://git.savannah.nongnu.org/git/simulavr.git"
        '0001-fix_check.patch')
sha256sums=('SKIP'
            'b8e271804031dcd9536553851e41296f24523e6a2c5a0e2154750f0ad80ef309')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --match 'release-*' | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i ../0001-fix_check.patch
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_TCL=ON \
    -DBUILD_PYTHON=ON \
    -DBUILD_VERILOG=ON

  make -j1 -C build
  make -j1 -C build progdoc
}

package() {
  cd "${srcdir}/${pkgname}/build"

  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/share/doc/common" "${pkgdir}/usr/share/doc/simulavr"

  # Headers are moved into their own subdirectory to prevent conflicts.
  # Might cause issues when using them.
  mv "${pkgdir}/usr/include" "${pkgdir}/usr/include-simulavr"
  mkdir "${pkgdir}/usr/include"
  mv "${pkgdir}/usr/include-simulavr" "${pkgdir}/usr/include/simulavr"
}
