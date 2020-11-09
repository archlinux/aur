# Maintainer: Archisman Panigrahi <apandada1[at]gmail[dot]com>
# Contributor: Mark Wagie (Yochanan), Frede Hundewadt (linux-aarhus)
_pkgname=cheese
pkgname=$_pkgname-csd-headerbar
pkgver=3.38.0
pkgrel=2
pkgdesc="Take photos and videos with your webcam, with fun graphical effects - With CSD headerbar patch for non-GNOME DEs"
url="https://wiki.gnome.org/Apps/Cheese"
arch=('aarch64' 'x86_64' 'armhf')
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf gnome-video-effects)
makedepends=(gobject-introspection vala git appstream-glib meson yelp-tools)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
provides=("cheese")
conflicts=("cheese")
_commit=2129dde7149bba5461590e575ce360e1dd6ef0ee  # tags/3.38.0^0
source=("git+https://gitlab.gnome.org/GNOME/cheese.git#commit=$_commit"
        "https://gitlab.gnome.org/GNOME/cheese/-/merge_requests/34.patch")
sha256sums=('SKIP'
            '164893fb4ee6fb6c22dd7951cb493c4ecf0e54aea3f6569f95b470bcff3f536a')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  git apply -3 ../34.patch
}

build() {
  arch-meson $_pkgname build -D tests=true
  meson compile -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$_pkgname/data}"
  export GSETTINGS_SCHEMA_DIR

  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
