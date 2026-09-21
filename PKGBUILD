# Maintainer: Gabriel <horizzon3507>
pkgname=opsh
pkgver=0.1.12
pkgrel=2
_sdkver=0.1.6
pkgdesc='A small, local-first shell written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/fireflylabss/opsh'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "optionSDK-$_sdkver.tar.gz::https://github.com/fireflylabss/optionSDK/archive/refs/tags/v$_sdkver.tar.gz")
sha256sums=('4a8fb69f5fc332dc2154a69d743b7ee4c3a05fd35f57236ad4ebdf445c204628'
            '0b1ca7a784519f1a61656fd154eb731b27b245d41bac5de5e6dd51539dd4bdc7')

prepare() {
  # Cargo.toml depends on optionSDK via path "../optionSDK".
  ln -sfn "optionSDK-$_sdkver" optionSDK
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

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
