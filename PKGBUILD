# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=goffice-minimal
pkgver=0.10.55  
pkgrel=1
pkgdesc="A GLib/GTK+ set of document-centric objects and charting library"
url="https://git.gnome.org/browse/goffice"
arch=(x86_64)
license=(GPL)
depends=('librsvg' 'gtk3' 'libgsf' 'libspectre' 'libxslt')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'autoconf-archive' 'git')
_commit=29c5bfe6333b499a051f969464c6804e28616736
conflicts=('goffice')
provides=('goffice')
source=("git+https://gitlab.gnome.org/GNOME/goffice.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-minimal}
  git describe --tags | sed 's/^GOFFICE_//;s/_/./g;s/-/+/g'
}

build() {
  cd ${pkgname%-minimal}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static \
	      --enable-introspection \
	      --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname%-minimal}
  make DESTDIR="${pkgdir}" install
}
