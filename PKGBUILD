# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

pkgname=tepl-git
pkgver=6.11.0.r16.gd7f7d71
pkgrel=2
pkgdesc="Library that eases the development of GtkSourceView-based text editors and IDEs"
arch=(x86_64)
url="https://gitlab.gnome.org/World/gedit/libgedit-tepl"
license=(LGPL-3.0-or-later)
depends=(
  libgedit-amtk
  libgedit-gfls
  cairo
  glib2
  glibc
  gsettings-desktop-schemas
  gtk3
  icu
  pango
  libhandy
  libgedit-gtksourceview-git
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(xorg-server-xvfb)
provides=("tepl=${pkgver}")
conflicts=(tepl)
source=("git+https://gitlab.gnome.org/World/gedit/libgedit-tepl.git")
sha256sums=('SKIP')

pkgver() {
  cd "libgedit-tepl"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "libgedit-tepl" build
  meson compile -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
