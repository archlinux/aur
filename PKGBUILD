# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>


pkgname=gnucash-python
_realname=gnucash
pkgver=3.0
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application with enabled python bindings."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'webkit2gtk' 'libgnome-keyring' 'libgnomecanvas' 'boost-libs' 'python')
makedepends=('intltool' 'boost' 'swig' 'gtest' 'gmock' 'gconf' 'cmake')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
provides=('gnucash')
conflicts=('gnucash')
source=(
	http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2
)
backup=(
	'etc/gnucash/config'
	'etc/gnucash/environment'
) 
sha1sums=('40fae0f3b3530190e74c9c58cd59af2c439a2d64')
sha256sums=('a5b5e1f69f328f7f71d609dced488ecca81b29be04fc2002cd9c3570118c45f6')
sha512sums=('e9c470c8a1c1abf2e4f92d27f1646637c9580d2dff8c93808bb9aded904d90e634fd2763f2c6280922e7eb56a986508dfef0a36409c1129fb3796c00e2465822')


prepare() {
  cd "${srcdir}"

  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
	-D WITH_PYTHON=ON \
	-D PYTHON_EXECUTABLE=$(which python) \
	"${srcdir}/${_realname}-${pkgver}"

}

build() {
  cd "${srcdir}/build"

  make -j $(cat /proc/cpuinfo | grep -ci '^processor')
}

package() {
  cd "${srcdir}/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
