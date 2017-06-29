# $Id$
# Maintainer: Jeb Rosen <jeb@jebrosen.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash-gtk3-git
pkgver=2.6.9.r1784.g6fbfb8222
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application (GTK3 development version)"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
conflicts=('gnucash')
provides=('gnucash')
depends=('guile' 'slib' 'goffice' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkit2gtk' 'libgnome-keyring' 'dconf' 'boost-libs')
makedepends=('intltool' 'gcc' 'pkgconfig' 'git' 'boost' 'swig' 'gmock' 'gtest' 'gconf')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
source=("$pkgname::git+https://github.com/Bob-IT/gnucash#branch=gtk3")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  # the line in boost includes is actually correct.
  # the check fails for a different reason
  sed -i '203s#-Werror ##' configure.ac

  autoreconf -fi
  intltoolize
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking \
    --disable-error-on-warning

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  cd src/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
