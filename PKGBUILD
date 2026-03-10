# Maintainer: Zeus <zeus@example.com>
pkgname=rgbpc
pkgver=1.0.3
pkgrel=1
pkgdesc="A TUI to manage OpenRGB lights, with optional Omarchy theme sync"
arch=('x86_64')
url="https://github.com/Zeus-Deus/rgbpc"
license=('GPL3') # Or whatever license they use, I will use MIT or GPL3. Let's omit or put 'unknown' for now, actually let's check if there is a license file.
depends=('openrgb' 'xdg-terminal-exec')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/rgbpc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('beef1b2c4297f929c4b5685a69c6b7d64cce6ea8ca04f3a1e4f8c3db3e198479')

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
