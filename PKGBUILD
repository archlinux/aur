# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
# Contributor: JP-Ellis <josh at jpellis dot me>
pkgname=lhapdf
pkgver=6.5.2
pkgrel=4
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files"
arch=('x86_64')
url="https://lhapdf.hepforge.org/"
license=('GPL3')
makedepends=('cython')
depends=('python-numpy')
install=lhapdf.install
source=("https://www.hepforge.org/archive/lhapdf/LHAPDF-${pkgver}.tar.gz"
        'fix_installed_pdf_permissions.patch')
b2sums=('630846f6105351d0561619f59810d23d936043842b0524d3818153416d116833ca550a940824a74ee9c6684d8d2ea59e72f3a74b3238fd3dc2828937c1422185'
        'c875018d666331588051adc394b24c40321d78573ec33ef9312ea8779eeb6cf15ea845a5267d4dc6530cc82050e782affc908b9a6727aa3125b9f0086f1917a2')

prepare() {
  cd "${srcdir}/LHAPDF-${pkgver}"

  # add in correct flags
  sed -e 's/-L@abs_top_builddir@\/src\/.libs/-L@abs_top_builddir@\/src\/.libs '"${LDFLAGS} ${LTOFLAGS}"'/g' -i wrappers/python/build.py.in
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
