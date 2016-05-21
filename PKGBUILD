# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=glade-3.18
_pkgname=${pkgname/-*/}
pkgver=3.18.3
pkgrel=2
pkgdesc="User interface builder for GTK+ and GNOME (version 3.18.x, with support for GtkActions)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3' 'libxml2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'python2-gobject' 'itstool' 'docbook-xsl')
optdepends=('python2: Python widgets support'
            'devhelp: help browser')
url="http://glade.gnome.org/"
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('ecdbce46e7fbfecd463be840b94fbf54d83723b3ebe075414cfd225ddab66452')

prepare() {
  cd "${_pkgname}-${pkgver}"
  sed -i "s#Exec=.*#Exec=${pkgname} %F#" data/glade.desktop.in.in
  sed -i "s#_Name=.*#_Name=Glade 3.18#" data/glade.desktop.in.in
}

build() {
  cd "${_pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure \
      --prefix=/opt/${pkgname} --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # Install executable file
  install -d -m 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/glade" "${pkgdir}/usr/bin/${pkgname}"
  # Install desktop file
  install -d -m 755 "${pkgdir}/usr/share/applications"
  mv "${pkgdir}/opt/${pkgname}/share/applications/${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rmdir "${pkgdir}/opt/${pkgname}/share/applications"
}
