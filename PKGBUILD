# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash
pkgver=2.7.5
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
backup=(
	'etc/gnucash/config'
	'etc/gnucash/environment'
) 
source=(
	https://github.com/Gnucash/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2
)
sha1sums=('df2c53c733b9e08904f5cbd508e20d5abeb40579')
sha256sums=('1d1596ce367e4e027ff63cb6b3502a1306a3045882caa567ca82e76c28ef224e')
sha512sums=('68cd6e6f61a43b8837e9efe693d22f62ebe10a8bb7d593814fb6a12d035d74ec1e444f53010ad53c6b1adf28c75aa482403c06052314a91636c2a8baa30e09af')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr ../

}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make -j $(cat /proc/cpuinfo | grep -ci '^processor')
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
