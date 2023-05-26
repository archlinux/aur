# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.5.4
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
b2sums=('9bd214f29ef0fb662095a045acf449bac60c2f12fb0e182c9c590ec51651f1c08d213a3f9280eda0711ec9a0d5cae620918f048c362838a9de8e69cc84f34798'
        'c875018d666331588051adc394b24c40321d78573ec33ef9312ea8779eeb6cf15ea845a5267d4dc6530cc82050e782affc908b9a6727aa3125b9f0086f1917a2')

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
