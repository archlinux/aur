# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=cheese
pkgname=(
  cheese
  libcheese
)
pkgver=44.1
pkgrel=4
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
source=(
  "git+https://gitlab.gnome.org/GNOME/cheese.git?signed#tag=$pkgver"
  cheese-gcc14.patch
  cheese-json.patch
)
b2sums=('8cd3406d53fa41311f1cab7b91b686e8de7c4b72109748a3604f9706c76c115adc1c09e180a9793bae146b5c0765bed49ca99d7ad955d322fce33ddebecf28bb'
        '43e4f929359457cc51e07a2ab589f31617f8652efaef3c95ac3485c22abf5d822a3eaa736931a96a49cfad2808de9a9c4d490be365b1ecb148da7c9f73be8ac3'
        'c1763f71522d9b54e89bef3ecacc1b310188aa3d33cff24a50cc85a68d6baf8422f0a26155dae7ba1fd736633bf8c5c5cd0d1002ce5107f4fae4a7d0e23cf529')
validpgpkeys=('4D0BE12F0E4776D8AACE9696E66C775AEBFE6C7D') # Jeremy Bicha <jeremy.bicha@canonical.com>

prepare() {
  cd cheese

  # Fix build with gcc14
  git apply -3 ../cheese-gcc14.patch

  # Fix JSON validation
  git apply -3 ../cheese-json.patch
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
