# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-llvm-lines
pkgver=0.4.16
pkgrel=1
pkgdesc="Count the number of lines of LLVM IR across all instantiations of a generic function"
arch=('any')
url='https://github.com/dtolnay/cargo-llvm-lines'
license=('Apache' 'MIT')
depends=('cargo' 'rust-nightly' 'rustfmt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('284fbd1d16c52392e2eb3b0a29a05be244672b0f8eb3b70447ae7840604419a4')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target

	# since currently the above runs no tests (kept only for future
	# proofing) run cargo llvm-lines on itself
	target/release/cargo-llvm-lines llvm-lines | head -n 8
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
