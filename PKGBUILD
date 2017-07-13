# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>

pkgname=gnucash-python
pkgver=2.6.13
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application. Includes Python2 support."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'goffice0.8' 'libgnomeui' 'libdbi-drivers' 'aqbanking' 'desktop-file-utils' 'webkitgtk2' 'python2' 'sqlite2')
makedepends=('intltool')
optdepends=('evince: for print preview'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-${pkgver}.tar.bz2)
sha512sums=('daad6d55485de6ce3ca6affe232c51252d853c803734f4737ab2477e7724c42fa2ea764f5fdeea00d956bcbaad338a30fe21c62a578a818d5e8b4f5878f060b5')
provides=("gnucash=${pkgver}")
conflicts=('gnucash')

prepare() {
  cd "${srcdir}/gnucash-${pkgver}"
  sed -i 's|guile-config|guile-config1.8|g' configure
}

build() {
  cd "${srcdir}/gnucash-${pkgver}"
  export GUILE=/usr/bin/guile1.8
  export PYTHON=python2.7
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking --enable-python
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
