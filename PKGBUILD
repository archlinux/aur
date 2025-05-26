# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-software-git
pkgver=48.0.r177.g1491665
pkgrel=2
pkgdesc="Allows you to find and install new apps"
url="https://gitlab.gnome.org/GNOME/gnome-software"
arch=(x86_64 aarch64)
license=(GPL-2.0-or-later)
depends=(
  appstream
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-app-list
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  json-glib
  libadwaita
  libgudev
  libsoup3
  libsysprof-capture
  libxmlb
  pango
  polkit
)
makedepends=(
  docbook-xsl
  flatpak
  fwupd
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  itstool
  libglib-testing
  malcontent
  meson
)
optdepends=(
  'flatpak: Flatpak support plugin'
  'fwupd: fwupd support plugin'
  'malcontent: Parental control plugin'
)
groups=(gnome-git)
provides=(gnome-software)
conflicts=(gnome-software)
source=("git+https://gitlab.gnome.org/GNOME/gnome-software.git"
	    "git+https://gitlab.gnome.org/mwleeds/gnome-pwa-list.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd gnome-software
  #git describe --long --tags | sed 's/^GNOME_SOFTWARE_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
  git describe --long --tags --abbrev=7 | sed 's/^GNOME_SOFTWARE_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gnome-software
  git submodule init
  git submodule set-url subprojects/gnome-pwa-list "$srcdir/gnome-pwa-list"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    -D packagekit=false
  )

  arch-meson gnome-software build "${meson_options[@]}"
  meson compile -C build
}

# Not running tests - need root and a D-Bus system bus

package() {
  meson install -C build --destdir "$pkgdir"
}
