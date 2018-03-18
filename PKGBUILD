# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>


pkgname=gnucash-python
_realname=gnucash
pkgver=2.7.6
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application with enabled python bindings."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'webkit2gtk' 'libgnome-keyring' 'libgnomecanvas' 'boost-libs' 'python2')
makedepends=('intltool' 'boost' 'swig' 'gtest' 'gmock' 'gconf' 'cmake')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
provides=('gnucash')
conflicts=('gnucash')
source=(
	http://downloads.sourceforge.net/sourceforge/${_realname}/${_realname}-${pkgver}.tar.gz
)
backup=(
	'etc/gnucash/config'
	'etc/gnucash/environment'
) 
sha1sums=('1d07697fad328e6b36a82ae988c6025447cc3c7c')
sha256sums=('e3177369890622ba9e2416c0b4ad9c648f7de928b46c5b47970b7cf5f797ebd7')
sha512sums=('5dd43d19b12a934bca0f769c631138e035ebf6e140c1253e881306d176d85b5726f5c762520706eb23ce893c84af768688bb8f0978e6cd543d07851c995d5c59')


prepare() {
  cd "${srcdir}"

  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
	-D WITH_PYTHON=ON \
	-D PYTHON_EXECUTABLE=$(which python2) \
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
