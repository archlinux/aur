# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=ccmeter
pkgver=2.0.0
pkgrel=1
pkgdesc="Terminal dashboard for monitoring Claude Code usage analytics"
arch=('x86_64')
url="https://github.com/hmenzagh/CCMeter"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hmenzagh/CCMeter/archive/v$pkgver.tar.gz")
sha256sums=('c9227016fc3ccbf3a2a087372a8031f7c0942368bb5a1d4591262a8a29e85ae6')

prepare() {
  cd "CCMeter-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "CCMeter-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "CCMeter-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features -- \
    --skip data::rate_limits::tests::detects_rate_limit_hit \
    --skip data::rate_limits::tests::deduplicates_same_minute
}

package() {
  cd "CCMeter-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
