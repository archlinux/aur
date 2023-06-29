# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=gnucash-xbt-minimal
_pkgname=gnucash
pkgver=5.3
pkgrel=2
_sourcerel=
pkgdesc="A personal and small-business financial-accounting application with Bitcoin but without ofx/qfx import and aqbanking support"
arch=(x86_64 aarch64)
url="http://www.gnucash.org"
license=(GPL)
depends=(webkit2gtk boost-libs libdbi libdbi-drivers guile libsecret)
makedepends=(boost cmake gmock libmariadbclient postgresql-libs swig)
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
        "xbt.patch")

sha256sums=('1458cb08c585eae9d724bec6f2812bcc03bbe83ed294a46a7897aaab01a6f15a'
            '8cf12425a9f66c69473d83582742244889dc0ffb854d3a502aca58bc649878d4')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/xbt.patch"

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
