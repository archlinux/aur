# Maintainer: Matt Shearing (https://github.com/matt-shearing)
pkgname=thrum
pkgver=0.4.0
pkgrel=1
pkgdesc='A Winamp-style music player and library manager that wears the Omarchy theme'
arch=('x86_64' 'aarch64')
url='https://github.com/matt-shearing/thrum'
license=('MIT')
conflicts=('omamp')
replaces=('omamp')
depends=(
  'bash'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
  'taglib'
  'sqlite'
  'ffmpeg'
  'ttf-jetbrains-mono-nerd'
)
optdepends=(
  'qt6-wayland: native Wayland window (otherwise runs under XWayland)'
  'xdg-desktop-portal: file and folder pickers'
  'chromaprint: fpcalc, for duplicate finding and AcoustID identification'
  'libsecret: secret-tool, to keep NAS and Subsonic passwords in the keyring'
  'xdg-utils: xdg-open, for "Show in folder"'
  'hyprland: hyprctl, to match the window rounding of the desktop'
  'quickshell: the Omarchy bar plugin in /usr/share/thrum/omarchy-plugin'
  'spotify-player: Spotify beside your own music (Settings > Spotify)'
)
makedepends=('pkgconf' 'cargo')
# makepkg's default LTO breaks the ring crate's C objects in the Spotify helper.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matt-shearing/thrum/archive/refs/tags/v$pkgver.tar.gz")
# Run updpkgsums once the v$pkgver tag is on GitHub.
sha256sums=('bdb54123eae540159eba53c36fbf6b8d38d26d859be9cf5df007185e908aab54')

prepare() {
  cd "$pkgname-$pkgver"
  # The Spotify session helper's crates, fetched here so build() needs no network.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path sidecar/thrum-spotify-session/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  qmake6 ../thrum.pro
  make
  cd ..
  # thrum-spotify-session reads Spotify's own playlists and artists' top
  # tracks (docs/spotify.md). Thrum finds it beside its own binary.
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=build/sidecar
  cargo build --frozen --release --manifest-path sidecar/thrum-spotify-session/Cargo.toml
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/thrum "$pkgdir/usr/bin/thrum"
  install -Dm755 build/sidecar/release/thrum-spotify-session "$pkgdir/usr/bin/thrum-spotify-session"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 pkgbuild/thrum.desktop "$pkgdir/usr/share/applications/thrum.desktop"
  install -Dm644 pkgbuild/thrum.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/thrum.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # The Omarchy bar plugin. It is per-user, so it is shipped here and each
  # user links it with /usr/share/thrum/omarchy-plugin/install.
  local plugin="$pkgdir/usr/share/$pkgname/omarchy-plugin"
  install -Dm644 -t "$plugin" omarchy-plugin/{manifest.json,Model.js,Service.qml,Widget.qml,README.md}
  install -Dm755 -t "$plugin" omarchy-plugin/{install,uninstall}
}
