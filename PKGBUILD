# $Id: PKGBUILD 206564 2014-03-01 15:20:03Z bpiotrowski $
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>

pkgname=gnucash-python
pkgver=2.6.3
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application. Includes Python2 support."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'goffice0.8' 'libgnomeui' 'libdbi-drivers' 'aqbanking' 'desktop-file-utils' 'webkitgtk2' 'python2')
makedepends=('intltool')
optdepends=('evince: for print preview'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
install=gnucash.install
source=(http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-${pkgver}.tar.bz2)
sha1sums=('40ea9c069d0ad0a811b74f00c2b32faad6108a6a')
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
