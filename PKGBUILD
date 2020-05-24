# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve-git
pkgver=3.1.8
pkgrel=1
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmp' 'mpfr')
optdepends=('cython: Python bindings'
            'gtk3: Graphical debugger'
            'octave: Octave bindings'
            'qt: Graphical interface xmpsolve')
makedepends=('git' 'gcc-fortran')
options=(!libtool)
provides=('mpsolve')
conflicts=('mpsolve')
source=("git://github.com/robol/MPSolve.git")
sha256sums=('SKIP')

pkgver () {
  cd MPSolve
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "${srcdir}/MPSolve"
  ./autogen.sh
  ./configure --prefix=/usr --disable-debug-build
  make
}

check () {
  cd "${srcdir}/MPSolve"
  make check
}

package () {
  cd "${srcdir}/MPSolve"
  make DESTDIR="${pkgdir}" install
  if [ -f ${pkgdir}/usr/share/octave/octave_packages ]; then
    sed -e "s/$(echo "${pkgdir}" | sed -e 's/[\/&]/\\&/g')//g" -i ${pkgdir}/usr/share/octave/octave_packages
  fi

  if [ -e doc/html ]; then
    cd doc/html
    find . -type f -exec install -D -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  fi
}
