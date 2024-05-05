# Maintainer:
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgbase="cheese"
pkgbase="$_pkgbase-git"
pkgname=(
  cheese-git
  libcheese-git
)
pkgver=44.1.r3.ga7af338
pkgrel=2
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://gitlab.gnome.org/GNOME/cheese"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  clutter-gtk
  gnome-desktop
  gstreamer
  gtk3
  libcanberra
)
makedepends=(
  appstream-glib
  clutter-gst
  git
  gobject-introspection
  gst-plugins-bad
  meson
  vala
  yelp-tools
)
checkdepends=(xorg-server-xvfb)

_pkgsrc="$_pkgbase"
source=("git+https://gitlab.gnome.org/GNOME/cheese.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D tests=true
  )

  arch-meson "$_pkgsrc" build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export GSETTINGS_SCHEMA_DIR="$srcdir/cheese/data"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
)

_pick() {
  local p="$1" f d
  shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_cheese-git() {
  depends+=("libcheese-git=$pkgver-$pkgrel")
  provides=("cheese")
  conflicts=("cheese")

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick libs usr/include
  _pick libs usr/lib/{girepository-1.0,libcheese*,pkgconfig}
  _pick libs usr/share/{gir-1.0,glib-2.0/schemas,gtk-doc}
}

package_libcheese-git() {
  pkgdesc="Webcam widget for Clutter and GTK"

  depends=(
    clutter
    clutter-gst
    clutter-gtk
    dconf
    gdk-pixbuf2
    glib2
    gnome-video-effects
    gst-plugins-bad-libs
    gst-plugins-base-libs
    gstreamer
    gtk3
    libcanberra
  )
  provides=(
    libcheese
    libcheese{,-gtk}.so
  )
  conflicts=(libcheese)

  mv libs/* "$pkgdir"
}
