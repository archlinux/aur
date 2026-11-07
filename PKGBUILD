# Maintainer: Jonas H <dev@serverjonas.de>

# Packages the GUI only. The daemon (`sjnmusicd`) and the CLI (`sjnmusic`)
# live in the same repository but are separate packages; this one installs
# just `sjnmusic-gui`, which talks HTTP to a running daemon on 127.0.0.1:14567
# (override with SJNMUSIC_HOST / SJNMUSIC_PORT).
#
# The `tray` cargo feature is deliberately not enabled: it needs
# `libappindicator-gtk3` at runtime, so it stays opt-in for custom builds.

pkgname=sjnmusic-gui-git
pkgver=0.1.0
pkgrel=1
pkgdesc="EGUI client for the sjnmusic music library daemon"
arch=(x86_64 aarch64)
url="https://github.com/serverjonas/SJNmusic"
license=(MIT)
depends=(
  gcc-libs
  glibc
  libglvnd # GL loader, eframe's glow backend
  libx11   # winit X11 backend (dlopen'd)
  libxcursor
  libxi
  libxkbcommon # keyboard input, X11 and Wayland
  libxrandr
  wayland # winit Wayland backend
)
makedepends=(cargo rust git)
options=(!lto) # LTO is set in gui-rs/Cargo.toml's release profile
source=("$pkgname::git+$url.git#branch=main")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  local version commits hash
  version=$(sed -n 's/^version = "\(.*\)"/\1/p' gui-rs/Cargo.toml | head -n1)
  commits=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  printf '%s.r%s.g%s\n' "${version//-/.}" "$commits" "$hash"
}

prepare() {
  cd "$pkgname/gui-rs"
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir -p .cargo
  cargo vendor --locked --versioned-dirs vendor > .cargo/config.toml
}

build() {
  cd "$pkgname/gui-rs"
  export CARGO_TARGET_DIR=target
  # --frozen: only the vendored sources are used.
  cargo build --release --frozen
}

package() {
  cd "$pkgname/gui-rs"
  install -Dm755 target/release/sjnmusic-gui "$pkgdir/usr/bin/sjnmusic-gui"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
