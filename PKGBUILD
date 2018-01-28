# $Id$
# Maintainer: Pieter Lenaerts <pieter dot lenaerts at gmail.com>
# Contributer: Jeb Rosen <jeb@jebrosen.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash-dev
pkgver=2.7.3
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application (GTK3 development version)"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
conflicts=('gnucash' 'gnucash-gtk3-git')
provides=('gnucash')
depends=('guile2.0' 'slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkit2gtk' 'libgnome-keyring' 'dconf' 'boost-libs')
makedepends=('intltool' 'boost' 'swig' 'gmock' 'gtest' 'gconf' 'cmake')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!emptydirs')
source=("https://github.com/Gnucash/gnucash/releases/download/${pkgver}/gnucash-${pkgver}.tar.bz2"
        "cmake-dbd-dir.patch")
md5sums=('8cb07caf79a84555f9b3d3a94173eb45'
         'fafcdd2a836ae79356afe994ca805976')
sha1sums=('d6d760092a30ffdab52f59f208e58017ec0dc7d6'
          '9c181b20d320c2ec8c62b5bcbed784d19730bfe9')
sha256sums=('5ea0912a527874f8410e80f63d94d63608ead2ff4c3ae25a8b203c25d1ee4749'
            'a0af8366d415c284171ece657572a2243ce61afa6fd168417f77ec4618f34f4a')

build() {
  cd "${srcdir}/gnucash-${pkgver}"

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
  cd "${srcdir}/gnucash-${pkgver}/build"

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
