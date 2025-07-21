# Maintainer: Aetf <aetf at unlimited-code dot works>
pkgname=unftp
pkgver=0.15.1
pkgrel=1
pkgdesc="A FTP(S) server with a couple of twists written in Rust."
arch=('x86_64')
url="https://github.com/bolcom/unFTP"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# Disable lto as it breaks rust -sys crates (undefined references when linking)
# See also https://github.com/Canop/broot/issues/852
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('9e2534c2571057b67e58b4dd3fcbee5bb36f320b20067c1d765e9503fd723e0669184aa7ab4e3127b239606b32ab4462d19ebf2fe3d6ba4af863ca11f5d1fdc6')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  CARGO_FEATURE_VENDORED=1 cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

