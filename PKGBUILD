# Maintainer: GGOBP <GGOBP at protonmail dot ch>

pkgname=mendimaru
pkgver=0.4.2
pkgrel=1
pkgdesc="Manage Mendix Studio Pro on Linux through WinBoat"
arch=('x86_64')
url="https://github.com/GG-O-BP/mendimaru"
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'freerdp'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
  'winboat'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'nodejs'
  'npm'
  'pango'
)
optdepends=(
  'chromium: discover installable Studio Pro versions from Mendix Marketplace'
  'docker: run the WinBoat Windows container'
  'docker-compose: use WinBoat with Docker Compose'
  'google-chrome: alternative browser for Marketplace version discovery'
  'podman-compose: use WinBoat with Podman Compose'
)
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4dead33a9f582ab6e33dc9a953583ebb161bbda102c39660105eb55c36bd3bb')

_set_rustflags() {
  local remap="--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"

  if [[ " ${RUSTFLAGS:-} " != *" $remap "* ]]; then
    export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }$remap"
  fi
}

prepare() {
  cd "$pkgname-$pkgver"

  export npm_config_audit=false
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_fund=false
  export npm_config_update_notifier=false
  npm ci

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "$pkgname-$pkgver"

  export npm_config_audit=false
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_fund=false
  export npm_config_update_notifier=false
  npm run build

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_NET_OFFLINE=true
  export CARGO_TARGET_DIR="$srcdir/$pkgname-$pkgver/src-tauri/target"
  _set_rustflags
  cargo build \
    --release \
    --locked \
    --features custom-protocol \
    --manifest-path src-tauri/Cargo.toml
  cargo rustc \
    --release \
    --locked \
    --features custom-protocol \
    --manifest-path src-tauri/Cargo.toml \
    --bin mendimaru \
    -- \
    -C link-arg=-Wl,-z,shstk
}

check() {
  cd "$pkgname-$pkgver"

  if [[ "${MENDIMARU_RUN_TESTS:-0}" != "1" ]]; then
    msg2 "Skipping the upstream test suite; set MENDIMARU_RUN_TESTS=1 to run it"
    return 0
  fi

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_NET_OFFLINE=true
  export CARGO_TARGET_DIR="$srcdir/$pkgname-$pkgver/src-tauri/target"
  _set_rustflags
  cargo test \
    --release \
    --locked \
    --features custom-protocol \
    --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src-tauri/target/release/mendimaru \
    "$pkgdir/usr/bin/mendimaru"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mendimaru.desktop" <<'EOF'
[Desktop Entry]
Name=Mendimaru
Comment=Manage Mendix Studio Pro through WinBoat
Exec=mendimaru
Icon=mendimaru
Terminal=false
Type=Application
Categories=Development;Utility;
StartupNotify=true
StartupWMClass=mendimaru
EOF

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/mendimaru.png"
  install -Dm644 src-tauri/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/mendimaru.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/mendimaru.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/mendimaru.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/mendimaru.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.ko.md "$pkgdir/usr/share/doc/$pkgname/README.ko.md"
  install -Dm644 README.ja.md "$pkgdir/usr/share/doc/$pkgname/README.ja.md"
}
