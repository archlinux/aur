# $Id$
# Maintainer: Jeb Rosen <jeb@jebrosen.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash-gtk3-git
pkgver=2.7.3.r1.g310442ffe
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application (GTK3 development version)"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
conflicts=('gnucash')
provides=('gnucash')
depends=('guile' 'slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkit2gtk' 'libgnome-keyring' 'dconf' 'boost-libs')
makedepends=('intltool' 'git' 'boost' 'swig' 'gmock' 'gtest' 'gconf')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!emptydirs')
source=("git+https://github.com/Gnucash/gnucash")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/gnucash"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/gnucash"

  # add -O to the boost c++11 compatibility detection so that -D_FORTIFY_SOURCE doesn't cause an error
  sed -i '/CXXFLAGS="-Werror -std=gnu++11 $BOOST_CPPFLAGS"/s/-Werror/-Werror -O/' configure.ac

  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking \
    --disable-error-on-warning

  make
}

package() {
  cd "${srcdir}/gnucash"

  # make install fails with parallel make, see
  # https://bugzilla.gnome.org/show_bug.cgi?id=644896#c11
  # using -j1 instead
  MAKEFLAGS="${MAKEFLAGS} -j1" make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  cd libgnucash/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnucash.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
}
