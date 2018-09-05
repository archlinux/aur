# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.30.0
pkgrel=1
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf)
makedepends=(intltool gobject-introspection itstool vala gnome-common git appstream-glib
             gnome-video-effects)
optdepends=('gnome-video-effects: Camera effects')
groups=(gnome)
options=(!emptydirs)
_commit=ab4bbb9ec65ae84607b95f0ca5bca61f7a8ac71f  # tags/3.30.0^0
source=("git+https://gitlab.gnome.org/GNOME/cheese.git#commit=$_commit")
sha256sums=('SKIP')

# TODO: Consider splitting libcheese

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
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
