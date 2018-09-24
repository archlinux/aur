# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=gnucash-xbt-minimal
_pkgname=gnucash
pkgver=3.2
pkgrel=2
_sourcerel=
pkgdesc="A personal and small-business financial-accounting application with Bitcoin but without ofx/qfx import and aqbanking support"
arch=(x86_64)
url="http://www.gnucash.org"
license=(GPL)
depends=(webkit2gtk boost-libs guile libsecret)
makedepends=(boost cmake gmock libdbi libdbi-drivers libmariadbclient postgresql-libs)
optdepends=(
	'gnucash-docs: for documentation'
	'iso-codes: for translation of currency names'
	'perl-finance-quote: for stock information lookups'
	'perl-date-manip: for stock information lookups'
)
options=(!emptydirs)
conflicts=(gnucash gnucash-devel gnucash-xbt)
provides=(gnucash)
source=("https://github.com/Gnucash/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}${_sourcerel}.tar.bz2"
        "xbt.patch"
        "0001-Fix-compiler-warning-issues.patch")
sha1sums=('4ab5baf0d7328e7b6f6a0cb0b4fea3864beb17dd'
          '52cf6820bf1dd87b5807997e49ec9c861ff516af'
          '2a206572b385288fd4a7dd9b2bedb2b793d4ca2b')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/xbt.patch"
  patch -Np0 -i "${srcdir}/0001-Fix-compiler-warning-issues.patch"

  cd "${srcdir}"
  mkdir build
  cd build

  cmake	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib \
	-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
	-DCOMPILE_GSCHEMAS=OFF \
	-DWITH_OFX=OFF \
	-DWITH_AQBANKING=OFF \
	-DHAVE_GWEN_GTK3=ON \
	"${srcdir}/${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/build"

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
