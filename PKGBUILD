# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="

pkgname=tetrs
pkgver=0.1.7
pkgrel=1
pkgdesc="Tetromino Game Engine + Terminal"
arch=('x86_64')
url="https://github.com/Strophox/tetrs"
license=('MIT')
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('826b909d173a5c8b7b0e83c97c7bc1519e932c222ef197a904f1a0fc7a135727a339e998d833b192d5e9509facb60c3efdcb447e6ca9fb8f4a1b891262db5c68')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo generate-lockfile
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --workspace tetrs_terminal
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/tetrs_terminal" "$pkgdir/usr/bin/tetrs_terminal"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
