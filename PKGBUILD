# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname=peanutbutter
pkgver=0.5.1
pkgrel=1
pkgdesc="Wayland screen locker for touchscreen devices"
url="https://git.sr.ht/~anjan/peanutbutter"
license=("AGPL-3.0-only")
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~anjan/peanutbutter/archive/$pkgver.tar.gz")
sha512sums=("2abf4599eb6e53584c49c4b3d0d548b60e9b5793d2fbf94542f09fa1e27e60d7aa110502ba18f5a8bc6b0afb601eb8a4d89045b93283072c4327583381e4a0b3")
arch=("x86_64")
depends=("pango" "cairo")
makedepends=("cargo" "scdoc")

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	scdoc < docs/peanutbutter.1.scd | gzip > peanutbutter.1.gz
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/peanutbutter -t "$pkgdir/usr/bin/"
	install -Dm644 peanutbutter.1.gz -t "$pkgdir/usr/share/man/man1/"
}
