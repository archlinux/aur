# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve
pkgver=3.2.3
pkgrel=1
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gmp' 'mpfr')
makedepends=('gcc-fortran')
optdepends=('cython: Python bindings'
            'doxygen: documentation (optional build-time dependency)'
            'gtk3: Graphical debugger'
            'qt5-base: Graphical interface xmpsolve')
options=(!libtool)
source=("https://numpi.dm.unipi.it/wp-content/uploads/2025/08/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1f2e239c698c783b63a5e6903e76316c0335a01d71c466a8551e8a3f790b3971')

prepare () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # precompiled versions in 3.2.3 tarball are incompatible with recent bison
  # see https://github.com/robol/MPSolve/issues/48
  rm src/libmps/monomial/yacc-parser.{c,h}
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-debug --disable-examples
  make
}

check () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  if [ -e doc/html ]; then
    cd doc/html
    find . -type f -exec install -D -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  fi
}
