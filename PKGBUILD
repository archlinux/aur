pkgname=libpeas-git
_pkgname=libpeas
pkgver=1.26.0+5+g53a4f19
pkgrel=1
pkgdesc="A GObject plugins library"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/Libpeas"
license=(GPL2)
depends=(gtk3 gobject-introspection-runtime)
makedepends=(gtk-doc python-gobject glade gobject-introspection git meson vala)
checkdepends=(xorg-server-xvfb)
optdepends=('python-gobject: Python loader')
provides=(libpeas libpeas{,-gtk}-1.0.so)
conflicts=(libpeas)
source=("git+https://gitlab.gnome.org/GNOME/libpeas.git")
sha512sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^libpeas-//;s/-/+/g'
}

build() {
  arch-meson $_pkgname build -D vapi=true -D gtk_doc=true
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

# vim:set ts=2 sw=2 et:
