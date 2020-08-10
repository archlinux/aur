# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.3.0
pkgrel=1
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files"
arch=('x86_64')
url="https://lhapdf.hepforge.org/"
license=('GPL3')
makedepends=('cython')
depends=('python')
install=lhapdf.install
source=("https://www.hepforge.org/archive/lhapdf/LHAPDF-${pkgver}.tar.gz")
sha256sums=('ed4d8772b7e6be26d1a7682a13c87338d67821847aa1640d78d67d2cef8b9b5d')

prepare() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    sed -e 's/print Cython.Compiler.Version.version/print (Cython.Compiler.Version.version)/g' -i m4/cython.m4
}

build() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    autoreconf -i
    ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
    ## will eventually be fixed upstream
    touch wrappers/python/lhapdf.pyx
    ./configure --prefix=/usr --datadir=/usr/share/lhapdf --docdir=/usr/share/doc/lhapdf --pdfdir=/usr/share/lhapdf/LHAPDF
    make
}

check() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    make -k check
}

package() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
