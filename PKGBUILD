# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve
pkgver=3.1.8
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
source=("http://numpi.dm.unipi.it/_media/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('53c39890a1cf4bfe505c5e4835b4b3f2aa56794b17ac59c018f1226f0acd323b')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
