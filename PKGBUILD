# Maintainer: João Vitor Polverari <dev at ayru dot dev>
pkgname=marmota-daily
pkgver=2.0.0
pkgrel=2
pkgdesc='Daily note templating system'
arch=('x86_64' 'aarch64')
url='https://github.com/B3ella/marmota'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('856b066e898314b19bf2f7c49aaf01029d93c5ef0aaf7a1209ecd8f263327e7d')

prepare() {
  cd "marmota-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "marmota-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "marmota-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "marmota-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/marmota"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
}
