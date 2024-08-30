# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="

pkgname=tetrs
pkgver=0.2.2
pkgrel=1
pkgdesc="Tetromino Game Engine + Terminal"
arch=('x86_64')
url="https://github.com/Strophox/tetrs"
license=('MIT')
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2517ee6ee3ef8e51ce6942c96136bde3cfebb3c559f6a439f47c523e1e511d08c0e9ee5a996222e01e44aff8ba97edba8e7225f977e09a936d39e55e59629eff')

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
