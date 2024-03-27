# Maintainer:
# Contributor: spikecodes <19519553+spikecodes@users.noreply.github.com>

_pkgname="xcp"
pkgname="$_pkgname-git"
pkgver=0.20.4.r4.g6356af3
pkgrel=1
pkgdesc="An extended 'cp'"
url="https://github.com/tarka/xcp"
license=("GPL-3.0-only")
arch=('x86_64')

makedepends=(
  'git'
  'cargo'
)

provides=("$_pkgname=${pkgver%%.r*}")
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
  export CARGO_HOME="${CARGO_HOME:-$SRCDEST/cargo-home}"
  export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
  export CARGO_TARGET_DIR=target

  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgsrc"
  ./tests/scripts/test-linux.sh
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "completions/$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm644 "completions/$_pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
