# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="

pkgname=tetrs
pkgver=0.2.5
pkgrel=1
pkgdesc="Tetromino Game Engine + Terminal"
arch=('x86_64')
url="https://github.com/Strophox/tetrs"
license=('MIT')
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('69439356b2204dc84684633be9e345628a93a3eba8692b1664c770a0f6c6643870b76ef64e87806961af639cdc69387caa8bd8bf9ea5f49ff6aea2f7281c58ae')

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
	cargo test --frozen --workspace tetrs_tui
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/tetrs_tui" "$pkgdir/usr/bin/tetrs_tui"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
