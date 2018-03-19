# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash
pkgver=2.7.7
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
       https://github.com/Gnucash/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2
)
sha1sums=('4d95e0e21406db19c7930a977c708b06e7d5e72f')
sha256sums=('ad91fc1ce1742489bca43f292b928e3106749dcbeb8d44a2a9295817d24892ed')
sha512sums=('b7d91e87c4bc4e604560f4502a86deaafa4f636e9fe2af26db53b11da9f48986c970ba0ed08cb7172ca08a5fb2da451d26976963241206c388a33555c80f28fe')
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
