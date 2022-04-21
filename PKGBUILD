# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

_crate="cargo-generate-rpm"
pkgname="$_crate"
pkgver=0.6.0
pkgrel=1
pkgdesc='Cargo helper command to generate a binary RPM package (.rpm) from Cargo project'
license=('Apache')
arch=('aarch64' 'i686' 'x86_64')
url="https://crates.io/crates/$_crate"
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('daf94e52ed13716b89e84ccbe76cd42c898b1881a770ff794bf0cec6665574a8e1e6659bc1cdf7f86abab1496df1f7428decdb248edd4943571b585b39a16f8f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
