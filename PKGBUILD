# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli
pkgver=0.4.10
pkgrel=1
pkgdesc='Unofficial CLI for Toggl Track written in Rust, using the v9 API.'
arch=(i686 x86_64)
url=https://github.com/watercooler-labs/toggl-cli
license=(MIT)
depends=(openssl)
makedepends=(cargo)
conflicts=("${pkgname}-bin")
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('076c99260a4c52d8ef4f91626aee1b83fc94f520be68448ade70a84ef51e176b02e5a974c29716edd09b2dda4b0d429e67bee90376902cb9c7c3df683b11049e')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-*}"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
