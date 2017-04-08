# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.24.0
pkgrel=1
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf)
makedepends=(pkgconfig intltool gobject-introspection itstool vala gnome-common git appstream-glib
             gnome-video-effects)
optdepends=('gnome-video-effects: Camera effects')
groups=(gnome-extra)
options=(!emptydirs)
_commit=e0f4befb62bb02522a364251e1be429942a1d446  # master~4
source=("git+https://git.gnome.org/browse/cheese#commit=$_commit")
sha256sums=('SKIP')

# TODO: Consider splitting libcheese

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  # Fixup tags for pkgver()
  git tag -f 3.24.0 e0f4befb62bb02522a364251e1be429942a1d446
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --disable-schemas-compile --libexecdir=/usr/lib/cheese \
      --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
