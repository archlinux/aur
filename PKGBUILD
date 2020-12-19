# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=cheese
pkgname=$_pkgname-git
pkgver=3.38.0+17+gf5553f7d
pkgrel=1
pkgdesc="Take photos and videos with your webcam, with fun graphical effects"
url="https://wiki.gnome.org/Apps/Cheese"
arch=(any)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good clutter-gst clutter-gtk
         libcanberra librsvg gnome-desktop libgudev dconf gnome-video-effects)
makedepends=(gobject-introspection vala git appstream-glib meson yelp-tools)
checkdepends=(xorg-server-xvfb)
provides=($_pkgname)
conflicts=($_pkgname)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/cheese.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  #git tag -f 3.34.0 61ff7a2c26b618cb24be7ca3c050530671055602  # Fixup missing tag
}

build() {
  arch-meson $_pkgname build -D tests=true
  ninja -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$_pkgname/data}"
  export GSETTINGS_SCHEMA_DIR

  xvfb-run meson test -C build --print-errorlogs
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
