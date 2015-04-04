# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=gnucash-xbt
_pkgname=gnucash
pkgver=2.6.6
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application with Bitcoin support"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'goffice0.8' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkitgtk2' 'libgnome-keyring' 'libgnomecanvas')
makedepends=('intltool')
optdepends=('evince: for print preview'
			'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
conflicts=('gnucash' 'gnucash-devel')
provides=('gnucash')
install=gnucash.install
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"
		"xbt.patch")
sha1sums=('7a508743047202cc4c648ff188f92741010105a1'
		  '7244b9cc71d0d03c43055c062f3eeba5e3544630')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/xbt.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  cd src/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
