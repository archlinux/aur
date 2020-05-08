# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=glade-git
pkgver=3.36.0.r2.gce473462
pkgrel=1
pkgdesc="User Interface Builder for GTK applications"
url="https://glade.gnome.org/"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL LGPL)
depends=(gtk3 libxml2)
makedepends=(gtk-doc gobject-introspection python-gobject itstool docbook-xsl git webkit2gtk meson)
checkdepends=(xorg-server-xvfb)
optdepends=('devhelp: development help')
groups=(gnome-extra)
provides=(glade libgladeui-2.so)
conflicts=(glade)
source=("git+https://gitlab.gnome.org/GNOME/glade.git")
sha256sums=(SKIP)

pkgver() {
    cd glade
    git describe --long --tags | sed 's/^GLADE_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson glade build -D gtk_doc=true
  ninja -C build
}

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
