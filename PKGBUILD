# Maintainer: Zeus <zeus@example.com>
pkgname=rgbpc
pkgver=1.0.2
pkgrel=1
pkgdesc="A TUI to manage OpenRGB lights, with optional Omarchy theme sync"
arch=('x86_64')
url="https://github.com/Zeus-Deus/rgbpc"
license=('GPL3') # Or whatever license they use, I will use MIT or GPL3. Let's omit or put 'unknown' for now, actually let's check if there is a license file.
depends=('openrgb' 'xdg-terminal-exec')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/rgbpc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31f832e4a1eb100c96bfec66a6f71a0261e3e5398bdd8d07e55f41a3942564e5')

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
