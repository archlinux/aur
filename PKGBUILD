# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>


pkgname=gnucash-python
_realname=gnucash
pkgver=2.6.17
pkgrel=2
pkgdesc="A personal and small-business financial-accounting application with enabled python bindings."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('guile' 'slib' 'goffice0.8' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkitgtk2' 'libgnome-keyring' 'libgnomecanvas' 'dconf' 'python2')
makedepends=('intltool' 'cairo<=1.14.8')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
provides=('gnucash')
conflicts=('gnucash')
source=(http://downloads.sourceforge.net/sourceforge/${_realname}/${_realname}-${pkgver}.tar.gz)
sha1sums=('d970d876f1fc7cd3fad9155463cdda348bcf0c7e')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  export PYTHON=$(which python2)
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking --enable-python
  make GUILD=/usr/bin/guild2.0
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  cd src/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
