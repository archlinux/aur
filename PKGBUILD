# Maintainer: Zeus-Deus
pkgname=rgbpc
pkgver=1.2.1
pkgrel=1
pkgdesc="A TUI to manage OpenRGB lights, with optional Omarchy theme sync"
arch=('x86_64')
url="https://github.com/Zeus-Deus/rgbpc"
license=('GPL3')
depends=('openrgb' 'xdg-terminal-exec')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/rgbpc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8a890051833823dafd7a4d57074d57bc57c6ccd2648519135c27ebdf63f773a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install the binary
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  
  # Install the desktop file
  install -Dm644 "assets/rgbpc.desktop" -t "$pkgdir/usr/share/applications/"
}
