# Maintainer: Coobyk <https://github.com/Coobyk>
pkgname=cumpressor
pkgver=0.1.0
pkgrel=1
pkgdesc="Private, on-device video compressor built with Rust and GPUI"
arch=('x86_64')
url="https://github.com/Coobyk/Cumpressor"
license=('MIT')
depends=('ffmpeg' 'fontconfig' 'freetype2' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Coobyk/Cumpressor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93d31dd4b965a8d093d428d89fa9e0ee8ed953d00e4f5008a15eab99d3f7ffa4')

prepare() {
  cd "Cumpressor-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Cumpressor-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --locked
}

# check() is omitted on purpose: the test suite compiles GPUI's headless
# window harness (doubling build time) and its encode tests need ffmpeg.

package() {
  cd "Cumpressor-$pkgver"
  install -Dm755 target/release/cumpressor -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
