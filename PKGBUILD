# Maintainer: fredrir <fhansteen at gmail dot com>

: "${CARGO_HOME:=$SRCDEST/cargo-home}"
: "${CARGO_TARGET_DIR:=target}"
: "${RUSTUP_TOOLCHAIN:=stable}"
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN
export LIBSSH2_SYS_USE_PKG_CONFIG=1
export ZSTD_SYS_USE_PKG_CONFIG=1

_pkgname=wezterm
pkgname=wezterm-fredrir-git
pkgver=20260816.143635.72f3fd75
pkgrel=1
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer (fredrir fork)"
arch=('x86_64')
url="https://github.com/fredrir/wezterm"
license=('MIT')
depends=(
  'bash'
  'fontconfig'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libgit2'
  'libssh2'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'openssl'
  'ttf-jetbrains-mono'
  'ttf-roboto'
  'wayland'
  'xcb-util'
  'xcb-util-image'
  'zlib'
  'zstd'
)
makedepends=(
  'cargo'
  'cmake'
  'git'
  'pkgconf'
  'python'
)
optdepends=(
  'ncurses: for the WezTerm terminfo database'
  'noto-fonts-emoji: for default fonts'
  'nautilus-python: for the WezTerm context menu in Nautilus'
  'ttf-nerd-fonts-symbols-mono: for default fonts'
)
provides=("wezterm=$pkgver")
conflicts=('wezterm' 'wezterm-shell-integration')
options=('!lto')
source=(
  "$_pkgname::git+$url.git#branch=fredrir"
  "$_pkgname-freetype2::git+https://github.com/freetype/freetype2.git"
  "$_pkgname-harfbuzz::git+https://github.com/harfbuzz/harfbuzz.git"
  "$_pkgname-libpng::git+https://github.com/glennrp/libpng.git"
  "$_pkgname-zlib::git+https://github.com/madler/zlib.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git -c core.abbrev=8 show -s \
    --format='%cd.%h' \
    --date=format:%Y%m%d.%H%M%S
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule."harfbuzz/harfbuzz".url "$srcdir/$_pkgname-harfbuzz"
  git config submodule."freetype/libpng".url "$srcdir/$_pkgname-libpng"
  git config submodule."deps/freetype/zlib".url "$srcdir/$_pkgname-zlib"
  git config submodule."freetype2".url "$srcdir/$_pkgname-freetype2"
  git -c protocol.file.allow=always submodule update --init --recursive

  sed -i 's/"vendored-fonts", //' wezterm-gui/Cargo.toml
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release --features distro-defaults
}

check() {
  cd "$_pkgname"
  cargo test --frozen --release -- --skip 'e2e::'
}

package() {
  cd "$_pkgname"

  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname-gui" -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname-mux-server" -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR/release/strip-ansi-escapes" -t "$pkgdir/usr/bin/"

  install -Dm644 assets/icon/terminal.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.$_pkgname.png"
  install -Dm644 "assets/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/org.wezfurlong.$_pkgname.desktop"
  install -Dm644 "assets/$_pkgname.appdata.xml" \
    "$pkgdir/usr/share/metainfo/org.wezfurlong.$_pkgname.appdata.xml"
  install -Dm644 "assets/$_pkgname-nautilus.py" \
    "$pkgdir/usr/share/nautilus-python/extensions/$_pkgname-nautilus.py"

  install -Dm755 "assets/open-$_pkgname-here" -t "$pkgdir/usr/bin/"
  install -Dm644 assets/shell-completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 assets/shell-completion/fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm644 assets/shell-completion/zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "assets/shell-integration/$_pkgname.sh" -t "$pkgdir/etc/profile.d/"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=2 sw=2 et:
