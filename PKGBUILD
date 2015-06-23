# Maintainer: Neng Xu <neng2.xu2@gmail.com>
# Contributor: quizzmaster

pkgname=gnucash-latest
pkgver=2.6.6
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('aqbanking' 'desktop-file-utils' 'goffice0.8' 'libdbi-drivers' 'libgnomecanvas' 'slib' 'webkitgtk2')
optdepends=('evince: for print preview'
  'perl-date-manip: for stock information lookups'
  'perl-finance-quote: for stock information lookups'
  )
makedepends=('intltool')
options=('!libtool' '!makeflags' '!emptydirs')
conflicts=('gnucash' 'gnucash-devel')
provides=('gnucash')
install=gnucash.install
source=(http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-${pkgver}.tar.bz2)
md5sums=('6c114e6c62c816410b18927a9596675c')

build() {
  cd "${srcdir}/gnucash-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-install --enable-ofx --enable-aqbanking
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
}
