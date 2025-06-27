# Maintainer:
# Contributor: Pig Fang <g-plane@hotmail.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="yazi"
pkgname="$_pkgname-git"
pkgver=25.5.31.r36.g8ef28ec
pkgrel=2
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O"
url="https://github.com/sxyazi/yazi"
arch=('x86_64' 'aarch64')
license=("MIT")

depends=(
  'gcc-libs'
  'oniguruma'
  'ttf-nerd-fonts-symbols'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  '7zip: for archive preview'
  'chafa: for previewing images'
  'fd: for file searching'
  'ffmpeg: for video thumbnails'
  'fzf: for directory jumping'
  'imagemagick: for previewing fonts'
  'jq: for JSON preview'
  'poppler: for PDF preview'
  'resvg: for SVG preview'
  'ripgrep: for file content searching'
  'zoxide: for directory jumping'
)

options=('!lto')

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

prepare() (
  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # compile faster, maybe
  shopt -s globstar
  sed -E -e 's&^(codegen-units) = [0-9]+$&\1 = 16&' \
    -i **/Cargo.toml
)

build() {
  export RUSTONIG_SYSTEM_LIBONIG=1

  cd "$_pkgsrc"
  YAZI_GEN_COMPLETIONS=true cargo build --release --frozen --no-default-features
  YAZI_GEN_COMPLETIONS=true cargo build --release -p "$_pkgname-cli"
}

check() {
  cd "$_pkgsrc"
  cargo test --frozen
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "target/release/yazi" "$pkgdir/usr/bin/yazi"
  install -Dm755 "target/release/ya" "$pkgdir/usr/bin/ya"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "assets/yazi.desktop" "$pkgdir/usr/share/applications/yazi.desktop"

  install -Dm644 assets/logo.png "$pkgdir/usr/share/pixmaps/yazi.png"

  cd "$srcdir/$_pkgsrc/yazi-boot/completions"
  install -Dm644 "yazi.bash" "$pkgdir/usr/share/bash-completion/completions/yazi"
  install -Dm644 "yazi.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_yazi" -t "$pkgdir/usr/share/zsh/site-functions/"

  cd "$srcdir/$_pkgsrc/yazi-cli/completions"
  install -Dm644 "ya.bash" "$pkgdir/usr/share/bash-completion/completions/ya"
  install -Dm644 "ya.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_ya" -t "$pkgdir/usr/share/zsh/site-functions/"
}
