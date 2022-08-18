# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.5.2
pkgrel=1
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files"
arch=('x86_64')
url="https://lhapdf.hepforge.org/"
license=('GPL3')
makedepends=('cython')
depends=('python')
install=lhapdf.install
source=("https://www.hepforge.org/archive/lhapdf/LHAPDF-${pkgver}.tar.gz")
sha256sums=('608a2753455e067a9940b5c16bc86ab6c47e2c749bc9dd19796996eb4352b2fd')

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
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run \
    --datarootdir=/usr/share/${pkgname} \
    --datadir=/usr/share/${pkgname} \
    --docdir=/usr/share/doc/${pkgname} \
    --pdfdir=/usr/share/${pkgname}/LHAPDF \
    --localedir=/usr/share/locale
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
