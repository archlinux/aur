# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

# Note: upstream uses custom CARGO_HOME
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="fractal"
pkgname="fractal-git"
pkgver=12.r122.g7c56918
pkgrel=1
pkgdesc="Matrix messaging app for GNOME written in Rust"
url="https://gitlab.gnome.org/World/fractal"
license=('GPL-3.0-only')
arch=('i686' 'x86_64')

depends=(
  'gst-plugins-base-libs'
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libshumate'
)
makedepends=(
  'blueprint-compiler'
  'clang'
  'git'
  'meson'
  'rust'
  'sass'
  'xdg-desktop-portal'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # speed up compilation
  sed -E \
    -e 's&^(\s*debug) = .*$&\1 = false&' \
    -e 's&^(\s*codegen-units) = .*$&\1 = 8&' \
    -i "$_pkgsrc/Cargo.toml"

  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  # NOTE: explicitly prevent rebuild: https://gitlab.gnome.org/GNOME/fractal/-/issues/1327
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
