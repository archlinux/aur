# Maintainer:
# Contributor: Pig Fang <g-plane@hotmail.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="yazi"
pkgname="$_pkgname-git"
pkgver=26.5.6.r47.gc92c4ab
pkgrel=2
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O"
url="https://github.com/sxyazi/yazi"
arch=('x86_64' 'aarch64')
license=("MIT")

depends=(
  'hicolor-icon-theme'
  'lua'
  'oniguruma'
  'ttf-font-nerd'
)
makedepends=(
  'cargo'
  'git'
  'imagemagick'
)
optdepends=(
  '7zip: for archive extraction and preview'
  'chafa: for ASCII image preview as fallback'
  'fd: for file searching'
  'ffmpeg: for video thumbnails'
  'fzf: for quick file subtree navigation'
  'git: for Yazi package management'
  'imagemagick: for image and font preview'
  'jq: for JSON preview'
  'poppler: for PDF preview'
  'resvg: for SVG preview'
  'ripgrep: for file content searching'
  'wl-clipboard: for Wayland clipboard support'
  'xclip: for X11 clipboard support'
  'xsel: for X11 clipboard support'
  'zoxide: for historical directories navigation'
)

options=('!lto')

provides=("$_pkgname")
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

  # Cargo does not provide an option to disable features for all workspace members
  # Upstream issue: https://github.com/rust-lang/cargo/issues/14866
  find -name Cargo.toml -type f -exec sed -i '/"vendored-lua"/d' {} +

  cargo fetch --locked --target host-tuple
)

build() {
  _units=$(($(nproc) > 16 ? $(nproc) : 16))
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=$_units

  cd "$_pkgsrc"
  export YAZI_GEN_COMPLETIONS=true
  export RUSTONIG_DYNAMIC_LIBONIG=1
  cargo build --release --frozen --no-default-features
}

check() {
  cd "$_pkgsrc"
  export RUSTONIG_DYNAMIC_LIBONIG=1
  cargo test --frozen --workspace --no-default-features
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR/release/ya" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

  _install_completions "$_pkgname-boot" "$_pkgname"
  _install_completions "$_pkgname-cli" "ya"

  cd assets
  install -Dm644 "yazi.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 <(magick logo.png -resize 512x512 -) "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}

_install_completions() {
  pushd "$1/completions"
  install -Dm644 "$2.bash" "$pkgdir/usr/share/bash-completion/completions/$2"
  install -Dm644 "$2.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_$2" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "$2.elv" -t "$pkgdir/usr/share/elvish/lib/"
  popd
}
