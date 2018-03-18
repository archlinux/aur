# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash
pkgver=2.7.6
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'webkit2gtk' 'libgnome-keyring' 'libgnomecanvas' 'boost-libs')
makedepends=('intltool' 'boost' 'swig' 'gtest' 'gmock' 'gconf' 'cmake')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
source=(
	http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2
)
sha1sums=('c9f27303bb178a02de5d8f03cba7bcc700cdb532')
sha256sums=('73f9afbff0dbafca04e4cddb6d8fe643975e6ffd4c4218ed8158f937a4bfdf28')
sha512sums=('4bf813f68987bcd8784e5cba3662b544bf2c28bad8dad71c728fda67970c1b2c221b027ab9c3fffd1c7e4024fd46ba054cbc9b8fa6de91ad50915610b1fd77f4')
backup=(
	'etc/gnucash/config'
	'etc/gnucash/environment'
) 
) 


prepare() {
  cd "${srcdir}"

  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr "${srcdir}/${pkgname}-${pkgver}"

}

build() {
  cd "${srcdir}/build"

  make -j $(cat /proc/cpuinfo | grep -ci '^processor')
}

package() {
  cd "${srcdir}/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
