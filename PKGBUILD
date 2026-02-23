# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname=s3tui
pkgver=0.4.2
pkgrel=2
pkgdesc="Simple S3 CLI client for file transfers and more"
arch=('x86_64')
url="https://github.com/softberries/s3tui"
license=('MIT')
depends=('gcc-libs')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6910f9819e4af278d58c8dea12d35054987f30b3bc5c7a735b6d3127b60ba1cd')
options=(!lto)

prepare() {
	cd "$pkgname-$pkgver"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_LTO=false

	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
