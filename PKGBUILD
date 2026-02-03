# Maintainer: Shahzeb Imran
# Contributor: Wez Furlong <wez at wezfurlong dot org>
# Contributor: Bernat Gabor <gaborjbernat@gmail.com>

# Set CARGO_HOME to a directory inside the build folder for the chroot
: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="wezterm"
pkgname="$_pkgname-sctk-adwaita-wayland-git"
pkgdesc="Wezterm with PR #7095 (SCTK Adwaita Wayland CSD support)"
pkgver=20240203.110809.r804.g5d795ed
pkgrel=1
url="https://github.com/wez/wezterm"
license=("MIT")
arch=("x86_64" "i686")

depends=(
  'bash' 'fontconfig' 'glib2' 'libssh2' 'libx11' 'libxcb' 'libxkbcommon'
  'libxkbcommon-x11' 'openssl' 'ttf-jetbrains-mono' 'ttf-roboto'
  'wayland' 'xcb-util' 'xcb-util-image' 'zlib'
)
makedepends=('cargo' 'cmake' 'git' 'python')
optdepends=('python-gobject: for nautilus extension')

provides=("$_pkgname")
conflicts=("$_pkgname" "wezterm-git" "wezterm-nightly-bin")
options=('!lto')

_source_main() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')
}

_source_wezterm() {
  local _sources_add=(
    'freetype.freetype2'::'git+https://github.com/freetype/freetype2.git'::'deps/freetype/freetype2'
    'glennrp.libpng'::'git+https://github.com/glennrp/libpng.git'::'deps/freetype/libpng'
    'harfbuzz'::'git+https://github.com/harfbuzz/harfbuzz.git'::'deps/harfbuzz/harfbuzz'
    'madler.zlib'::'git+https://github.com/madler/zlib.git'::'deps/freetype/zlib'
  )

  local _p _idx _src _sm_prep
  for _p in "${_sources_add[@]}"; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_wezterm() (
    cd \"\$srcdir/\$_pkgsrc\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_main
_source_wezterm

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  cd "$_pkgsrc"

  # Merge the PR
  msg2 "Fetching and merging PR #7095..."
  git fetch origin pull/7095/head

  git -c user.email="makepkg@archlinux.org" -c user.name="Arch Linux" \
    merge --no-edit --squash FETCH_HEAD

  # Restore Harfbuzz to the version from main branch
  msg2 "Restoring Harfbuzz submodule..."
  git checkout HEAD -- deps/harfbuzz/harfbuzz

  git -c user.email="makepkg@archlinux.org" -c user.name="Arch Linux" \
    commit -m "merge 7095"

  _run_if_exists _prepare_wezterm

  # Apply Arch-specific changes
  sed -i 's/"vendored-fonts", //' wezterm-gui/Cargo.toml
  
  # Download rust crates
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/([^-]*-g)/r\1/;s/-[^-]*-r/-r/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  LIBSSH2_SYS_USE_PKG_CONFIG=1 cargo build --frozen --release --features distro-defaults
}

check() {
  cd "$_pkgsrc"
  # Clean chroot might fail on some e2e tests due to lack of display/dbus
  LIBSSH2_SYS_USE_PKG_CONFIG=1 cargo test --frozen --release -- --skip "e2e::sftp" --skip "e2e::agent_forward"
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR"/release/wezterm -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR"/release/wezterm-gui -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR"/release/wezterm-mux-server -t "$pkgdir/usr/bin/"
  install -Dm755 "$CARGO_TARGET_DIR"/release/strip-ansi-escapes -t "$pkgdir/usr/bin/"

  install -Dm644 assets/icon/terminal.png "$pkgdir/usr/share/pixmaps/org.wezfurlong.wezterm.png"
  install -Dm644 assets/wezterm.desktop "$pkgdir/usr/share/applications/org.wezfurlong.wezterm.desktop"
  install -Dm644 assets/wezterm.appdata.xml "$pkgdir/usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml"
  install -Dm644 assets/wezterm-nautilus.py "$pkgdir/usr/share/nautilus-python/extensions/wezterm-nautilus.py"

  install -Dm755 assets/open-wezterm-here -t "$pkgdir/usr/bin/"
  install -Dm644 assets/shell-completion/bash "$pkgdir/usr/share/bash-completion/completions/wezterm"
  install -Dm644 assets/shell-completion/zsh "$pkgdir/usr/share/zsh/site-functions/_wezterm"
  install -Dm644 assets/shell-completion/fish "$pkgdir/usr/share/fish/completions/wezterm.fish"
  install -Dm644 assets/shell-integration/wezterm.sh "$pkgdir/etc/profile.d/wezterm.sh"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
