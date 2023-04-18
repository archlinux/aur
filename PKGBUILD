# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=cheese
pkgname=(
  cheese
  libcheese
)
pkgver=44.0.1
pkgrel=1
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(x86_64)
license=(GPL)
depends=(
  clutter-gst
  clutter-gtk
  dconf
  gnome-desktop
  gnome-video-effects
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gstreamer
  gtk3
  libcanberra
  libgudev
  librsvg
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
checkdepends=(xorg-server-xvfb)
_commit=7dbce9f06de65233ab0bf20e59a85d04850b94a8  # tags/44.0.1^0
source=("git+https://gitlab.gnome.org/GNOME/cheese.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd cheese
  git describe --tags | sed 's/\.\([a-z]\)/\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd cheese
}

build() {
  arch-meson cheese build -D tests=true
  meson compile -C build
}

check() (
  export GSETTINGS_SCHEMA_DIR="$PWD/cheese/data"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

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
  depends=(
    clutter
    clutter-gst
    clutter-gtk
    gdk-pixbuf2
    glib2
    gst-plugins-bad-libs
    gst-plugins-base-libs
    gstreamer
    gtk3
    libcanberra
  )
  provides=(libcheese{,-gtk}.so)

  mv libs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
