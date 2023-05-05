#Maintainer: GT610 <myddz1005@163.com>

pkgname=gnome-desktop-338
pkgver=3.38.9
pkgrel=1
pkgdesc="Library with common API for various GNOME modules (Version 3.38)"
url="https://gitlab.gnome.org/GNOME/gnome-desktop"
arch=(x86_64)
license=(GPL LGPL)
conflicts=(gnome-desktop gnome-desktop-git)
depends=(gsettings-desktop-schemas gtk3 libxkbfile xkeyboard-config iso-codes libseccomp bubblewrap systemd-libs)
makedepends=(gobject-introspection git meson gtk-doc yelp-tools)
checkdepends=(xorg-server-xvfb)
provides=(libgnome-desktop-3.so)
_commit=8662b94232a2d65f1aa76acb3d9e20a8b70489cf  # tags/3.38.4^0
source=("https://download.gnome.org/sources/gnome-desktop/3.38/gnome-desktop-3.38.9.tar.xz")
sha256sums=('SKIP')

prepare() {
  cd gnome-desktop-3.38.9
}

build() {
  arch-meson gnome-desktop-3.38.9 build \
    -D gnome_distributor="Arch Linux" \
    -D gtk_doc=true \
    -D date_in_gnome_version=false
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
