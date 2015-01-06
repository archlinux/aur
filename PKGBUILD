# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=gnucash-xbt
pkgver=2.6.5
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application with Bitcoin support"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'goffice0.8' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'desktop-file-utils' 'webkitgtk2' 'libgnome-keyring' 'libgnomecanvas')
makedepends=('intltool')
optdepends=('evince: for print preview'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
conflicts=('gnucash', 'gnucash-devel')
provides=('gnucash')
install=gnucash.install
source=("http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-${pkgver}.tar.bz2"
		"xbt.patch")
sha1sums=('c9a5184603e41c6582f8342d4be9e392eceef33f'
		  '3556218003a0caa823ea87c8c19e2a8e99c244d5')

prepare() {
  cd "${srcdir}/gnucash-${pkgver}"
  patch -Np0 -i "${srcdir}/xbt.patch"
}

build() {
  cd "${srcdir}/gnucash-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking
  make
}

package() {
  cd "${srcdir}/gnucash-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  cd src/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnucash.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
