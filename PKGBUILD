# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.34.0
pkgrel=2
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf gnome-video-effects)
makedepends=(gobject-introspection vala git appstream-glib meson yelp-tools)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
_commit=61ff7a2c26b618cb24be7ca3c050530671055602  # master
source=("git+https://gitlab.gnome.org/GNOME/cheese.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  git tag -f 3.34.0 61ff7a2c26b618cb24be7ca3c050530671055602  # Fixup missing tag
}

build() {
  arch-meson $pkgname build -D tests=true
  ninja -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$pkgname/data}"
  export GSETTINGS_SCHEMA_DIR

  xvfb-run meson test -C build --print-errorlogs
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
