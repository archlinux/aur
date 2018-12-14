# Contributor: megadriver <megadriver at gmx dot com>
# Based on gnumeric from [extra]
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnumeric-minimal
_pkgname=gnumeric
_minorver=44
pkgver=1.12.${_minorver}
pkgrel=1
pkgdesc="A GNOME-less spreadsheet program"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/gnumeric/"
license=('GPL')
depends=("goffice>=0.10.${_minorver}")
makedepends=('intltool' 'itstool')
conflicts=('gnumeric')
provides=('gnumeric')
options=('libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz revert-warnings.patch::https://projects.archlinux.de/svntogit/packages.git/plain/trunk/revert-warnings.patch?h=packages/gnumeric)
sha256sums=('60ea794bf3bffe54fe3d56305e487947d30c14b525fd7c8ad46d79c384498704'
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
              --without-python --without-gda \
	      --with-help-dir=/usr/share/gnome/help
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/etc/gconf
}
