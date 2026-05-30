# Maintainer: beac0n <gh@schempp.dev>

pkgname=ruroco-client
pkgver=0.14.1
pkgrel=1
pkgdesc='ruroco client CLI — sends encrypted one-way UDP remote-command packets'
arch=('x86_64')
url='https://github.com/beac0n/ruroco'
license=('MIT')
depends=('openssl' 'gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("ruroco-$pkgver.tar.gz::https://github.com/beac0n/ruroco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3236dc6ccb73af6fc58b8f43f01a32594550a82dddf896554a0be41ce88acfa3')

prepare() {
  cd "$srcdir/ruroco-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/ruroco-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # client binary only — neither the GUI (eframe) nor the server code is
  # compiled. The release-build feature is omitted so OpenSSL links dynamically
  # against the system package instead of being vendored.
  cargo build --release --frozen --no-default-features --features with-client --bin client
}

package() {
  cd "$srcdir/ruroco-$pkgver"
  install -Dm755 target/release/client "$pkgdir/usr/bin/ruroco-client"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
