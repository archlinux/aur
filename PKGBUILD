# Maintainer: LargeModGames <LargeModGames@gmail.com>
pkgname=spotatui
pkgver=0.28.1
pkgrel=1
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui"
arch=('x86_64')
url="https://github.com/LargeModGames/spotatui"
license=('MIT')
depends=('openssl')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fbeea1a63953efda2b24251e1a459aa36f7594674db6d7535cf1d14f89b488cc')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Unset RUSTFLAGS to avoid LLD linker issues with ring crate
  unset RUSTFLAGS
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
