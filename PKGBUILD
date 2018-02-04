# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash
pkgver=2.7.4
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
sha1sums=('b9807d8fa222c6a3747575956a7d52ebfaeffb1c')
sha256sums=('a00d1ba3e12f406a90a852543c56b9116ccbade264ada44aa6b8e0936c895891')
sha512sums=('d096ec2a3907dcd09c936f0a49ef6fb5028a17d2e0ade9e68eae7303530480ce19e08c1864efd862d363fda9ef6343260396b794b3c4ac74544baa2628a310eb')

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
