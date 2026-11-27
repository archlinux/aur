pkgname=qrx
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI tool to capture a screen region, decode any QR code found, and copy the result to clipboard."
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/qrx"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("b2962840409636ff2036d40fc9820a88adf7a212067b0b43d4e1a435fbdefe35")

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/qrx"
}
