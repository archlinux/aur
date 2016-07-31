# Maintainer: Henk te Sligte <henk@hjts.nl>
# Contributor: damir <damir@archlinux.org>

pkgname=dasher
pkgver=5.0.0.alpha+24+gb0a3e18
pkgrel=1
pkgdesc="Information-efficient text-entry interface, driven by natural continuous pointing gestures"
arch=('i686' 'x86_64')
license=('GPL')
depends=('speech-dispatcher' 'gtk3')
makedepends=('git' 'gnome-common' 'gnome-doc-utils')
url="http://www.gnome.org"
options=('!emptydirs')
source=('git://git.gnome.org/dasher#commit=b0a3e1807a6a294064ea7073b67fec3ce4c62b1d')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^DASHER_//' -e 's/_/./g'
}

prepare() {
  cd $pkgname
  rm -f m4/glib-gettext.m4
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper --enable-speech
  make
  Src/Gtk2/generate-schema -s > dasher.gschema.xml
}

package() {
  cd $pkgname
  install -Dm644 dasher.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/dasher.gschema.xml"
  make DESTDIR="${pkgdir}" install
}
