# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve
pkgver=3.2.1
pkgrel=1
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('x86_64')
license=('GPL')
depends=('gmp' 'mpfr')
makedepends=('gcc-fortran')
optdepends=('cython: Python bindings'
            'doxygen: documentation (optional build-time dependency)'
            'gtk3: Graphical debugger'
            'octave: Octave bindings'
            'qt5-base: Graphical interface xmpsolve')
options=(!libtool)
source=("http://numpi.dm.unipi.it/_media/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "https://raw.githubusercontent.com/robol/MPSolve/master/examples/octave/octave_support.h")
sha256sums=('45b22f6b04544b9eda2457eec58580d892c7e00824ebd2d6e31fe24cdd763804'
            'd88d5e982b11512e7e2af82db89f0481759d9c50c27d9c8261220bd1b508f136')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ln -sf ../../../octave_support.h examples/octave/
  ./configure --prefix=/usr --disable-debug
  make
}

check () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  if [ -f "${pkgdir}/usr/share/octave/octave_packages" ]; then
    sed -e "s/$(echo "${pkgdir}" | sed -e 's/[\/&]/\\&/g')//g" -i "${pkgdir}/usr/share/octave/octave_packages"
  fi

  if [ -e doc/html ]; then
    cd doc/html
    find . -type f -exec install -D -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  fi
}
