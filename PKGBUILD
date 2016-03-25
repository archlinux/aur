# Contributor: megadriver <megadriver at gmx dot com>
# Based on gnumeric from [extra]
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnumeric-minimal
_pkgname=gnumeric
pkgver=1.12.28
pkgrel=1
pkgdesc="A GNOME-less spreadsheet program"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/gnumeric/"
license=('GPL')
depends=("goffice>=0.10.28" 'desktop-file-utils')
makedepends=('intltool')
install=gnumeric-minimal.install
conflicts=('gnumeric')
provides=('gnumeric')
options=('libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz revert-warnings.patch::https://projects.archlinux.de/svntogit/packages.git/plain/trunk/revert-warnings.patch?h=packages/gnumeric)
sha256sums=('02d4ad13389e51f24638a0a59dbfb870ec8120efc453b2dca8804167f2b94dbb'
            'bcafca016b809000c2a5bf911e2e3dfa4de28f9e541d9964574cac5c7ce09e53')
options=('!makeflags')

prepare() {
  cd "${srcdir}/"${_pkgname}-${pkgver}
  patch -Np0 -i "${srcdir}"/revert-warnings.patch
  # Remove invalid mime type. (FS#26338)
  sed -i -e 's/zz-application\/zz-winassoc-xls;//' gnumeric.desktop.in
}

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install --disable-ssindex \
              --without-gnome --without-psiconv --without-perl \
              --without-python --without-gda
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/etc/gconf"
  rm -rf "${pkgdir}/usr/share/gnome"
}
