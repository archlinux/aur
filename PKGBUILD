# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=gnucash-xbt
_pkgname=gnucash
pkgver=3.0
pkgrel=1
_sourcerel=
pkgdesc="A personal and small-business financial-accounting application with Bitcoin support"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('libmariadbclient' 'postgresql-libs' 'aqbanking' 'webkit2gtk' 'boost-libs' 'libsecret' 'libdbi-drivers')
makedepends=('boost' 'gmock' 'gwenhywfar' 'cmake')
optdepends=(
	'gnucash-docs: for documentation'
	'iso-codes: for translation of currency names'
	'perl-finance-quote: for stock information lookups'
	'perl-date-manip: for stock information lookups'
)
options=('!makeflags' '!emptydirs')
conflicts=('gnucash' 'gnucash-devel')
provides=('gnucash')
source=("https://github.com/Gnucash/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}${_sourcerel}.tar.bz2"
		"xbt.patch")
sha1sums=('a575e853668b93b34dcd94f0ef0d1fee25b0165f'
		  '52cf6820bf1dd87b5807997e49ec9c861ff516af')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/xbt.patch"

  cd "${srcdir}"
  mkdir build
  cd build
  cmake	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib \
	-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
	-DCOMPILE_GSCHEMAS=NO \
	-DWITH_OFX=ON \
	-DWITH_AQBANKING=ON \
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
