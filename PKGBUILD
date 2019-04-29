# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.2.1
pkgrel=4
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files"
arch=('x86_64')
url="https://lhapdf.hepforge.org/"
license=('GPL3')
makedepends=('cython')
depends=('python' 'python2')
# install=lhapdf.install
source=("https://www.hepforge.org/archive/lhapdf/LHAPDF-${pkgver}.tar.gz")
sha256sums=('6d57ced88592bfd0feca4b0b50839110780c3a1cd158091c075a155c5917202e')

prepare() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    sed -e 's/print Cython.Compiler.Version.version/print (Cython.Compiler.Version.version)/g' -i m4/cython.m4

    cd "${srcdir}"
    cp -r "LHAPDF-${pkgver}" "LHAPDF-${pkgver}-py2"
}

build() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    autoreconf -i
    ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
    ## will eventually be fixed upstream
    touch wrappers/python/lhapdf.pyx
    ./configure --prefix=/usr --datadir=/usr/share/lhapdf --docdir=/usr/share/doc/lhapdf --pdfdir=/usr/share/lhapdf/LHAPDF
    make

    cd "${srcdir}/LHAPDF-${pkgver}-py2"
    autoreconf -i
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr --datadir=/usr/share/lhapdf --docdir=/usr/share/doc/lhapdf --pdfdir=/usr/share/lhapdf/LHAPDF
    make
}

check() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    make -k check

    cd "${srcdir}/LHAPDF-${pkgver}-py2"
    make -k check
}

package() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    make DESTDIR="${pkgdir}/" install

    cd "${srcdir}/LHAPDF-${pkgver}-py2"
    make DESTDIR="${pkgdir}/" install
}
