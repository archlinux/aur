# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

pkgname=tepl-git
pkgver=6.9.0.r4.gdec59c9
pkgrel=1
pkgdesc="Library that eases the development of GtkSourceView-based text editors and IDEs"
arch=(x86_64)
url="https://gitlab.gnome.org/swilmet/tepl"
license=(LGPL2.1)
depends=(
  libgedit-amtk
  cairo
  glib2
  glibc
  gsettings-desktop-schemas
  gtksourceview4
  icu
  pango
  libhandy
  libgedit-gtksourceview-git
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(xorg-server-xvfb)
provides=("tepl=${pkgver}")
conflicts=(tepl)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "tepl"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "tepl" build
  meson compile -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
