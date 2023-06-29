# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname="gedit"
pkgname="${_pkgname}-git"
pkgver=45.0.r1.g8b240c60a
pkgrel=1
pkgdesc="GNOME Text Editor"
url="https://wiki.gnome.org/Apps/Gedit"
arch=(
  i686
  x86_64
  armv7h
  aarch64
)
license=(GPL)
depends=(
  dconf
  gsettings-desktop-schemas
  gspell
  gtksourceview4
  libgedit-gtksourceview
  libpeas
  python-gobject
  'tepl-git>=6')
makedepends=(
  git
  gobject-introspection
  gtk-doc
  meson
  vala
  yelp-tools
)
optdepends=(
  'gedit-plugins: Additional features'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=(gnome gnome-git)
source=(
  "git+https://gitlab.gnome.org/GNOME/gedit.git"
  "git+https://gitlab.gnome.org/GNOME/libgd.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  git submodule init
  git config --local submodule.libgd.url "${srcdir}/libgd"
  git submodule update
}

build() {
  arch-meson gedit build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
