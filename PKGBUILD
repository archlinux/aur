# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=gnucash-xbt-minimal
_pkgname=gnucash
pkgver=3.1
pkgrel=2
_sourcerel=-1
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
options=(!makeflags !emptydirs)
conflicts=(gnucash gnucash-devel gnucash-xbt)
provides=(gnucash)
source=("https://github.com/Gnucash/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}${_sourcerel}.tar.bz2"
		"xbt.patch"
		"gcc8.patch")
sha1sums=('8ba1e61db532571e9c5423caadfbc551f6fb1b82'
		  '52cf6820bf1dd87b5807997e49ec9c861ff516af'
		  '26704ecc0d611eff806b6bc7c3f1b632f1348980')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/xbt.patch"
  patch -Np0 -i "${srcdir}/gcc8.patch"

  cd "${srcdir}"
  mkdir build
  cd build

  cmake	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib \
	-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
	-DHAVE_GWEN_GTK3=ON \
	-DCOMPILE_GSCHEMAS=OFF \
	-DWITH_OFX=OFF \
	-DWITH_AQBANKING=OFF \
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
