# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=cheese
pkgname=(cheese libcheese)
pkgver=41.1
pkgrel=2
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf gnome-video-effects)
makedepends=(gobject-introspection vala git appstream-glib meson yelp-tools)
checkdepends=(xorg-server-xvfb)
_commit=7fc2ed5cc4f52ff8e3199e491f72e4aa59fdf373  # gnome-41
source=("git+https://gitlab.gnome.org/GNOME/cheese.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd cheese
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd cheese
  git tag -f 41.1 7fc2ed5cc4f52ff8e3199e491f72e4aa59fdf373 # Fixup misplaced tag
}

build() {
  arch-meson cheese build -D tests=true
  meson compile -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/cheese/data}"
  export GSETTINGS_SCHEMA_DIR

  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
)

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_cheese() {
  depends+=("libcheese=$pkgver-$pkgrel")
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick libs usr/include
  _pick libs usr/lib/{girepository-1.0,libcheese*,pkgconfig}
  _pick libs usr/share/{gir-1.0,glib-2.0/schemas,gtk-doc}
}

package_libcheese() {
  pkgdesc="Webcam widget for Clutter and GTK"
  depends=(clutter clutter-gtk clutter-gst gdk-pixbuf2 glib2 gtk3 libcanberra
           gstreamer gst-plugins-base-libs gst-plugins-bad-libs)
  provides=(libcheese.so libcheese-gtk.so)
  mv libs/* "$pkgdir"
}

# vim:set sw=2 et:
