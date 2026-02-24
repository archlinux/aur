# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname=s3tui
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple S3 CLI client for file transfers and more"
arch=('x86_64')
url="https://github.com/softberries/s3tui"
license=('MIT')
depends=('gcc-libs')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b865c93ba2910785c56748a815a1f4cfcf1f0bba9d2dac4b3b855589f1421020')
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
