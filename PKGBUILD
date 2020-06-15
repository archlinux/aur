# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Fabien COUTANT

pkgname=glade-gtk2
_pkgname=glade3
pkgver=3.8.6
pkgrel=1
pkgdesc='User interface builder for GTK+ and GNOME (latest version for GTK2)'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils')
makedepends=('intltool' 'itstool' 'python2' 'gobject-introspection' 'python2-gobject2' 'gtk-doc')
optdepends=('devhelp: Integrated docs'
            'python2: Python widgets support')
url='http://glade.gnome.org/'
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver:0:3}/${_pkgname}-${pkgver}.tar.xz"
        "no-check-format-nonliteral.patch")
sha256sums=('aaeeebffaeb3068fb23757a2eede46adeb4c7cecc740feed7654e065491f5449'
            'e2b383720f5ab53fc581f71f8d6aac5bd0080245400eaef9b29030d7c88fb66b')
options=('!libtool')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p2 -i "${srcdir}/no-check-format-nonliteral.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --disable-static
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/glade3/catalogs"/*.in
  # We append (GTK2) to the Name entries in the .desktop file
  # to recognize the variant we wish to work with if we have
  # both the GTK3 and GTK2 variants installed
  sed -i 's/Name.*/& (GTK2)/g' "${pkgdir}/usr/share/applications/glade-3.desktop"
}
