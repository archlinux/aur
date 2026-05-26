# Maintainer: LargeModGames <LargeModGames@gmail.com>
pkgname=spotatui
pkgver=0.38.4
pkgrel=1
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui"
arch=('x86_64')
url="https://github.com/LargeModGames/spotatui"
license=('MIT')
depends=('openssl' 'pipewire')
makedepends=('cargo' 'clang')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('818efbea8ee8c7bea20063f9fd2a6447497efe4395732ab3d5b7797c4fb8c4d4')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
