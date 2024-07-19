# Maintainer:
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

_pkgname="joshuto"
pkgname="$_pkgname-git"
pkgver=0.9.8.r19.g235f339
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
url="https://github.com/kamiyaa/joshuto"
license=('LGPL-3.0-only')
arch=('x86_64')

depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  "git"
  "cargo"
)
optdepends=(
  'fzf: for better file searching'
  'xclip: for clipboard support on X11'
  'xsel: for clipboard support on X11'
  'wl-clipboard: for clipboard support on Wayland'
  'zoxide: for use in cd functions'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_cargo_env() {
  : ${CARGO_HOME:=$SRCDEST/cargo-home}

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
}

prepare() {
  _cargo_env

  cd "$_pkgsrc"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CFLAGS+=" -ffat-lto-objects"

  _cargo_env

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "$_pkgsrc/target/release/$_pkgname" -t "$pkgdir/usr/bin/"
}
