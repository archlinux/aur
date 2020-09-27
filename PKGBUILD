# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.34.0+91+gc5cf9af9
pkgrel=1
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf gnome-video-effects)
makedepends=(gobject-introspection vala git appstream-glib meson yelp-tools)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
_commit=c5cf9af92aeff68152f6c298458b2908b5079c7f  # master
source=("git+https://gitlab.gnome.org/GNOME/cheese.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D tests=true
  meson compile -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$pkgname/data}"
  export GSETTINGS_SCHEMA_DIR

  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
