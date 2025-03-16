# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>

_pkgname=loupe
pkgname=loupe-git
pkgver=48.0.r3.g89ae7b6
pkgrel=1
pkgdesc="simple image viewer for GNOME"
arch=(x86_64 aarch64)
url="https://gitlab.gnome.org/GNOME/loupe"
license=('GPL-3.0-or-later')
depends=(
  cairo
  dconf
  gcc-libs
  desktop-file-utils
  glib2
  glibc
  glycin
  graphene
  gtk4-git
  hicolor-icon-theme
  lcms2
  libadwaita-git
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

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
