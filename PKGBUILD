# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>

_pkgname=loupe
pkgname=loupe-git
pkgver=50.0.r16.gd5bf3df
pkgrel=1
pkgdesc="simple image viewer for GNOME"
url="https://gitlab.gnome.org/GNOME/loupe"
arch=(x86_64 aarch64)
license=(GPL-3.0-or-later)
depends=(
  bubblewrap
  cairo
  dconf
  fontconfig
  glib2
  glibc
  glycin
  graphene
  gtk4
  hicolor-icon-theme
  lcms2
  libadwaita
  libgcc
  libgweather-4
  libseccomp
)
makedepends=(
  git
  itstool
  meson
  rust
)
provides=(loupe)
conflicts=(loupe)
source=("git+$url.git")
b2sums=('SKIP')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # Match CARGO_HOME in src/meson.build
  CARGO_HOME="$srcdir/build/cargo-home" \
    cargo fetch --locked --target host-tuple
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --no-rebuild
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
