# Contributor: megadriver <megadriver at gmx dot com>
# Based on gnumeric from [extra]
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnumeric-minimal
_pkgname=gnumeric
pkgver=1.12.23
pkgrel=1
pkgdesc="A GNOME-less spreadsheet program"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/gnumeric/"
license=('GPL')
depends=('goffice>=0.10.23' 'desktop-file-utils')
makedepends=('intltool')
install=gnumeric-minimal.install
conflicts=('gnumeric')
provides=('gnumeric')
options=('libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz nested_decl.patch)
md5sums=('4e1844f3fd6162a7b0a96d3325dcac5d'
         '4368ba37f04c0674ed3cba9a82881700')
options=('!makeflags')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Create a dummy file to trick gnumeric into building without docs
  # Got this from the gnumeric SlackBuild
  touch doc/C/gnumeric-C.omf.out
  
  # Remove invalid mime type. (FS#26338)
  sed -i -e 's/zz-application\/zz-winassoc-xls;//' gnumeric.desktop.in
  sed -i 's+-Werror=implicit-function-declaration++' configure
  sed -i 's+-Werror=nested.externs++' configure
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install --disable-ssindex \
              --without-gnome --without-psiconv --without-perl \
              --without-python --without-gda
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/etc/gconf"
  rm -rf "${pkgdir}/usr/share/gnome"
}
