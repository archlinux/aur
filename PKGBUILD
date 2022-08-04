# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-llvm-lines
pkgver=0.4.17
pkgrel=2
pkgdesc="Count the number of lines of LLVM IR across all instantiations of a generic function"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/dtolnay/cargo-llvm-lines'
license=('Apache' 'MIT')
depends=('cargo' 'rust-nightly' 'rustfmt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1e0e09f95bd70256c9e25d43d20a6340a9a507e5c1d414deef478f365945f5c4')

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
