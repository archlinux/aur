# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.2.3
pkgrel=3
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files"
arch=('x86_64')
url="https://lhapdf.hepforge.org/"
license=('GPL3')
makedepends=('cython')
depends=('python' 'python2')
install=lhapdf.install
source=("https://www.hepforge.org/archive/lhapdf/LHAPDF-${pkgver}.tar.gz"
        'fix_typo.patch')
sha256sums=('d6e63addc56c57b6286dc43ffc56d901516f4779a93a0f1547e14b32cfd82dd1'
            '6ababeef3831d1bc2f708d0fbbf5e759aa983a83f9bec18706d3cb1ce257b536')

prepare() {
    cd "${srcdir}/LHAPDF-${pkgver}"
    sed -e 's/print Cython.Compiler.Version.version/print (Cython.Compiler.Version.version)/g' -i m4/cython.m4
    patch -Np1 -i "${srcdir}/fix_typo.patch"
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
