# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=papers-git
_reponame=papers
pkgver=51.beta.r11.ga65a3db
pkgrel=1
pkgdesc='Document viewer for PDF and other document formats aimed at the GNOME desktop'
arch=(x86_64)
url='https://apps.gnome.org/Papers/'
license=(GPL-2.0-or-later)
groups=(gnome)
depends=(
  cairo
  dconf
  djvulibre
  exempi
  libgcc
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  libarchive
  libnautilus-extension
  libspelling
  libtiff
  pango
  poppler-glib
)
makedepends=(
  appstream
  blueprint-compiler
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  itstool
  libsysprof-capture
  meson
  rust
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/GNOME/papers.git")
b2sums=('SKIP')

# Use debug
# export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

pkgver() {
  cd "$_reponame"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_reponame"

  CARGO_HOME="$srcdir/build/cargo-home" \
    cargo fetch --locked --target host-tuple
}

build() {
  arch-meson "$_reponame" build -Dtests=false
  meson compile -C build
}

# thumbnailer test fails in `pkgctl build` container, possibly due to missing test-data
# check() {
#   meson test -C build --print-errorlogs --no-rebuild
# }

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}

