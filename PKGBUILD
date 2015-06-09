# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Brenden Mervin <bmervin@utk.edu>

pkgname=silo
pkgver=4.10.2
pkgrel=2
pkgdesc="A Mesh and Field I/O Library and Scientific Database"
url="https://wci.llnl.gov/simulation/computer-codes/silo"
arch=('i686' 'x86_64')
depends=('qt4' 'python2' 'szip' 'hdf5')
makedepends=('gcc-fortran')
license=('BSD' 'custom')
source=(https://wci.llnl.gov/content/assets/docs/simulation/computer-codes/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3af87e5f0608a69849c00eb7c73b11f8422fa36903dd14610584506e7f68e638')

_install_docs=1

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Out of source build
  rm -rf build
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  export PYTHON=/usr/bin/python2
  ../configure --prefix=/usr \
    --enable-shared --enable-optimization \
    --enable-fortran --enable-browser \
    --enable-silex \
    --with-Qt-dir= --with-Qt-include-dir=/usr/include/qt4 \
    --with-Qt-bin-dir=/usr/lib/qt4/bin  --with-Qt-lib-dir=/usr/lib \
    --with-Qt-lib="{QtCore,QtGui}" \
    --with-zlib=/usr/include,/usr/lib \
    --with-hdf5=/usr/include,/usr/lib \
    --enable-pythonmodule \
    --with-szlib=/usr/lib \
    --enable-install-lite-headers \
    --enable-hzip --enable-fpzip

  make
}

check(){
  cd "${srcdir}/${pkgname}-${pkgver}/build/tests"

  # Quick test
  make testall
  ./testall

  # All tests, but tests 33 (rocket) and 46 (write objects) failed,
  # and they all failed with an out of source build
  #make check PYTHON=/usr/bin/python2 BROWSER="${srcdir}/${pkgname}-${pkgver}/build/tools/browser"
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  if [ ${_install_docs} -eq 1 ]
  then
    make DESTDIR="${pkgdir}" install-html
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/docs/Silo.book.pdf" \
      "${pkgdir}/usr/share/doc/${pkgname}/Silo.book.pdf"
  fi

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 BSD_LICENSE_README "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-BSD"
}
