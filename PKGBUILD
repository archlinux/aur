# Maintainer: FabioLolix <fabio.loli@disroot.org>
# Contributor: Zdeněk Janeček <jan.zdenek@gmail.com>

pkgname=entangle-git
pkgver=3.0.r47.g69039aa
pkgrel=1
pkgdesc="GTK graphical interface for tethered photography with digital cameras powered by libgphoto2"
arch=(x86_64 i686 aarch64)
url="https://gitlab.com/entangle/entangle"
license=(GPL-3.0-or-later)
depends=(dbus-glib gdk-pixbuf2 gtk3 libgphoto2 libgudev gobject-introspection lcms2
         libpeas libgexiv2 libraw adwaita-icon-theme gstreamer itstool gst-plugins-base-libs)
makedepends=(git intltool meson gtk-doc glib2-devel)
provides=(entangle)
conflicts=(entangle)
source=("git+https://gitlab.com/entangle/entangle.git")
sha256sums=('SKIP')

pkgver() {
  cd "entangle"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd "entangle"
  sed -i "s/'libraw_r'/'raw_r'/g" meson.build
  arch-meson build -Denable-gtk-doc=true
  ninja -C build all
}

check() {
  cd "entangle"
  ninja -C build test
}

package() {
  cd "entangle"
  DESTDIR="$pkgdir" ninja -C build install
}