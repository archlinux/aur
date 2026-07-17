# Maintainer: Shahzeb Imran
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Wez Furlong <wez at wezfurlong dot org>

_pkgname=wezterm
pkgname="$_pkgname-sctk-adwaita-wayland-git"
pkgver=20240203.110809.r869.g76b606e
pkgrel=1
# Upstream commit the patch is generated against; bump together with the patch.
_commit=76b606ec597a3c0263fa60321548637451c0a547
pkgdesc="Wezterm with sctk-adwaita Wayland CSD support (PR #7095)"
arch=('x86_64')
url="https://github.com/wezterm/wezterm"
license=('MIT')
depends=(
  'bash'
  'fontconfig'
  'libgcc'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libssh2'
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
)
makedepends=('cargo' 'cmake' 'git' 'pkgconf' 'python')
optdepends=(
  'ncurses: for wezterm terminfo database'
  'noto-fonts-emoji: for default fonts'
  'python-nautilus: WezTerm context menu in Nautilus'
  'ttf-nerd-fonts-symbols-mono: for default fonts'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'wezterm-git' 'wezterm-nightly-bin' 'wezterm-shell-integration')
replaces=('wezterm-shell-integration')
options=('!lto')
source=(
  "$_pkgname::git+$url.git#commit=$_commit"
  "$_pkgname-freetype2::git+https://github.com/freetype/freetype2.git"
  "$_pkgname-zlib::git+https://github.com/madler/zlib.git"
  "$_pkgname-harfbuzz::git+https://github.com/harfbuzz/harfbuzz.git"
  "$_pkgname-libpng::git+https://github.com/glennrp/libpng.git"
  'sctk-adwaita-wayland.patch'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '27456e4d79fce0cc98e26b3cbfd495379781e512de89af1e0a1c665f43db0d77')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --exclude='[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/([^-]*-g)/r\1/;s/-[^-]*-r/-r/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init

  git config submodule."harfbuzz/harfbuzz".url "$srcdir/$_pkgname-harfbuzz"
  git config submodule."freetype/libpng".url "$srcdir/$_pkgname-libpng"
  git config submodule."deps/freetype/zlib".url "$srcdir/$_pkgname-zlib"
  git config submodule."freetype2".url "$srcdir/$_pkgname-freetype2"

  git -c protocol.file.allow=always submodule update --init --recursive

  # Apply the sctk-adwaita Wayland CSD patch.
  # --3way lets it merge cleanly even as upstream main drifts.
  git apply --3way "$srcdir/sctk-adwaita-wayland.patch"

  sed -i 's/"vendored-fonts", //' wezterm-gui/Cargo.toml
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  LIBSSH2_SYS_USE_PKG_CONFIG=1 cargo build --frozen --release --features distro-defaults
}

check() {
  cd "$_pkgname"
  LIBSSH2_SYS_USE_PKG_CONFIG=1 cargo test --frozen --release -- --skip "e2e::sftp"
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 755 "target/release/$_pkgname-gui" -t "$pkgdir/usr/bin"
  install -Dm 755 "target/release/$_pkgname-mux-server" -t "$pkgdir/usr/bin"
  install -Dm 755 "target/release/strip-ansi-escapes" -t "$pkgdir/usr/bin"
  install -Dm 644 "assets/icon/terminal.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.$_pkgname.png"
  install -Dm 644 "assets/$_pkgname.desktop" "$pkgdir/usr/share/applications/org.wezfurlong.$_pkgname.desktop"
  install -Dm 644 "assets/$_pkgname.appdata.xml" "$pkgdir/usr/share/metainfo/org.wezfurlong.$_pkgname.appdata.xml"
  install -Dm 644 "assets/$_pkgname-nautilus.py" "$pkgdir/usr/share/nautilus-python/extensions/$_pkgname-nautilus.py"
  install -Dm 755 "assets/open-$_pkgname-here" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 assets/shell-completion/bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 assets/shell-completion/fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm 644 assets/shell-completion/zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm 644 assets/shell-integration/$_pkgname.sh -t "$pkgdir/etc/profile.d"
}

# vim: ts=2 sw=2 et:
