# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.5.5
pkgrel=1
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files"
arch=('x86_64')
url="https://lhapdf.hepforge.org/"
license=('GPL3')
makedepends=('cython')
depends=('python-numpy')
install=lhapdf.install
source=("https://www.hepforge.org/archive/lhapdf/LHAPDF-${pkgver}.tar.gz"
        'fix_installed_pdf_permissions.patch')
b2sums=('14677cfb0e40e61006eb2cd69373a14d8c4049a6c19d2a504b736c733be35c25a11362e5aa0d0fe233d7c477fe5f9ef60084ca71330566b2728908017ccf90e7'
        '5d47b87e8a83e177d93960140c71367d53ae07d3c861b0ed28efcdcee88e9ebb03e1292220ab1c061c63176aba9e5a304e24d535c8c78d9cd50a688a604f5f45')

prepare() {
  cd "${srcdir}/LHAPDF-${pkgver}"

  # add in correct flags
  sed '/linkargs =/a linkargs += " '"${LDFLAGS} ${LTOFLAGS}"' "' -i wrappers/python/build.py.in
  # installed PDFs must respect system permissions and ownership structure
  patch -Np1 -i "${srcdir}/fix_installed_pdf_permissions.patch"
}

build() {
  cd "${srcdir}/LHAPDF-${pkgver}"
  export CXXFLAGS="$CFLAGS"  # do not define _GLIBCXX_ASSERTIONS
  autoreconf -i
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
  # for some reason Python build fails otherwise
  export RIVET_LOCAL=ON
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
