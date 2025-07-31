# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=cheese
pkgname=(
  cheese
  libcheese
)
pkgver=44.1
pkgrel=5
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(x86_64)
license=('GPL-2.0-or-later AND CC-BY-SA-3.0')
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
  glib2-devel
  gobject-introspection
  meson
  vala
  yelp-tools
)
checkdepends=(xorg-server-xvfb)
source=("git+https://gitlab.gnome.org/GNOME/cheese.git?signed#tag=$pkgver")
b2sums=('8cd3406d53fa41311f1cab7b91b686e8de7c4b72109748a3604f9706c76c115adc1c09e180a9793bae146b5c0765bed49ca99d7ad955d322fce33ddebecf28bb')
validpgpkeys=('4D0BE12F0E4776D8AACE9696E66C775AEBFE6C7D') # Jeremy Bicha <jeremy.bicha@canonical.com>

prepare() {
  cd cheese

  # Fix build with gcc14
  # https://gitlab.gnome.org/GNOME/cheese/-/merge_requests/70
  git cherry-pick -n 101507f74eafaef8f6cf905e1c13a634f205f43c

  # Fix JSON validation
  # https://gitlab.gnome.org/GNOME/cheese/-/merge_requests/73
  git cherry-pick -n 77c3e96ed59afc641e9b591c4e3ece22a1c2c9f0

  # Set prgname to application ID
  # https://gitlab.gnome.org/GNOME/cheese/-/merge_requests/74
  git cherry-pick -n 020ed5d716bd01c0f01f6d488326386be903d165
}

build() {
  local meson_options=(
    -D tests=true
  )

  arch-meson cheese build "${meson_options[@]}"
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
