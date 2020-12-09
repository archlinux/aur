# Contributor: megadriver <megadriver at gmx dot com>
# Based on gnumeric from [extra]
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnumeric-minimal
_pkgname=gnumeric
_minorver=48
pkgver=1.12.${_minorver}
pkgrel=2
pkgdesc="A GNOME-less spreadsheet program"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/gnumeric/"
license=('GPL')
depends=("goffice>=0.10.${_minorver}")
makedepends=('intltool' 'itstool' 'yelp-tools')
conflicts=('gnumeric')
provides=('gnumeric')
options=('libtool')
source=(https://gitlab.gnome.org/GNOME/gnumeric/-/archive/GNUMERIC_${pkgver//./_}/gnumeric-GNUMERIC_${pkgver//./_}.tar.bz2 revert-warnings.patch::https://projects.archlinux.de/svntogit/packages.git/plain/trunk/revert-warnings.patch?h=packages/gnumeric)
sha256sums=('3c48d3aac7c1e207fcffeb2ba72f9df3b299199b0cf38446c8647f9fd29c4d58'
            'bcafca016b809000c2a5bf911e2e3dfa4de28f9e541d9964574cac5c7ce09e53')

prepare() {
  cd ${_pkgname}-GNUMERIC_${pkgver//./_}
  patch -Np0 -i "${srcdir}"/revert-warnings.patch
}

build() {
  cd ${_pkgname}-GNUMERIC_${pkgver//./_}
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install --disable-ssindex \
              --without-gnome --without-psiconv --without-perl \
              --without-python --without-gda \
	      --with-help-dir=/usr/share/gnome/help
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}-GNUMERIC_${pkgver//./_}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/etc/gconf
}
