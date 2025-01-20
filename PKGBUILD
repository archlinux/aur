# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

_pkgname="fractal"
pkgname="fractal-git"
pkgver=9.r171.g07f36e2
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
  'libpipewire'
  'libshumate'
  'libwebp'
)
makedepends=(
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

_rust_env() {
  # NOTE: upstream uses a custom CARGO_HOME from within meson
  export CARGO_HOME="$srcdir/build/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _rust_env

  # speed up compilation
  sed -E \
    -e 's&^(\s*debug) = .*$&\1 = false&' \
    -e 's&^(\s*codegen-units) = .*$&\1 = 8&' \
    -i "$_pkgsrc/Cargo.toml"

  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _rust_env
  CFLAGS+=" -ffat-lto-objects"
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  _rust_env
  meson test -C build --print-errorlogs
}

package() {
  _rust_env
  # NOTE: explicitly prevent rebuild: https://gitlab.gnome.org/GNOME/fractal/-/issues/1327
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
