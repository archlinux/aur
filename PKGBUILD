# Maintainer: LargeModGames <LargeModGames@gmail.com>
pkgname=spotatui
pkgver=0.42.0
pkgrel=2
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui"
arch=('x86_64')
url="https://github.com/LargeModGames/spotatui"
license=('MIT')
depends=('openssl' 'pipewire')
makedepends=('cargo' 'clang')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('563aa915f4bd47c9f9647e405885ccfb97f69a0e6422e3223a030a2f77dbec59')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # No --target: cargo before 1.95 (rust-lang/cargo#15399) reads every locked
  # dependency when a bin target has required-features, and --frozen then fails
  # on the macOS-only crates that a targeted fetch skipped.
  cargo fetch --locked
}

build() {
  export CARGO_PROFILE_RELEASE_LTO=false
  cd "$pkgname-$pkgver"
  # Strip LTO flags to prevent libspa-sys wrapper symbol being dropped
  export RUSTFLAGS="${RUSTFLAGS//-Clto=*/} -Clto=no"
  export CFLAGS="${CFLAGS//-flto*/}"
  export CXXFLAGS="${CXXFLAGS//-flto*/}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/spotatui" "$pkgdir/usr/bin/spotatui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install and fix desktop file
  if [ -f "snap/gui/spt.desktop" ]; then
      install -Dm644 "snap/gui/spt.desktop" "$pkgdir/usr/share/applications/spotatui.desktop"
      sed -i 's/Exec=spt/Exec=spotatui/' "$pkgdir/usr/share/applications/spotatui.desktop"
      sed -i '/Icon=/d' "$pkgdir/usr/share/applications/spotatui.desktop" # Remove snap-specific icon path
  fi
}
