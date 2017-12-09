# $Id$
# Maintainer: Jeb Rosen <jeb@jebrosen.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash-gtk3-git
pkgver=2.7.2.r37.gac89797e7
pkgrel=2
pkgdesc="A personal and small-business financial-accounting application (GTK3 development version)"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
conflicts=('gnucash')
provides=('gnucash')
depends=('guile2.0' 'slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkit2gtk' 'libgnome-keyring' 'dconf' 'boost-libs')
makedepends=('intltool' 'git' 'boost' 'swig' 'gmock' 'gtest' 'gconf' 'cmake')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!emptydirs')
source=("git+https://github.com/Gnucash/gnucash"
        "cmake-dbd-dir.patch")
sha1sums=('SKIP'
          '9c181b20d320c2ec8c62b5bcbed784d19730bfe9')

pkgver() {
  cd "${srcdir}/gnucash"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/gnucash"
  patch -Np1 < ../cmake-dbd-dir.patch
}

build() {
  cd "${srcdir}/gnucash"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DWITH_OFX=ON \
    -DWITH_AQBANKING=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

  make VERBOSE=1
}

package() {
  cd "${srcdir}/gnucash/build"

  # make install fails with parallel make, see
  # https://bugzilla.gnome.org/show_bug.cgi?id=644896#c11
  # using -j1 instead
  MAKEFLAGS="${MAKEFLAGS} -j1" make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

#  cd libgnucash/doc/design
#  make DESTDIR="${pkgdir}" install-info
  rm -f "${pkgdir}"/usr/share/glib-2.0/schemas/*.compiled

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnucash.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
}
