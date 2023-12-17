# Maintainer: Marieke Westendorp <ma3ke.cyber@gmail.com>
pkgname=tid
pkgver=0.1.2
pkgrel=1
pkgdesc="A small system information bar"
arch=('x86_64')
url="https://git.sr.ht/~ma3ke/tid"
license=('MIT')
depends=()
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
backup=("etc/tid/tid.config")
sha512sums=('57a68311f7522fb366c91952ec0b4780cea30ac3c6b044d190b6a18376500b3ae6b6658428bde0fc1d707bc110c4ef13a29724ce98221729b88e3895c3ef9fa7')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo test --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 755 "target/release/tid" "$pkgdir/usr/bin/tid"

	mkdir -p "$pkgdir/etc/tid"
	mkdir -m 655 "$pkgdir/etc/tid/fonts"
	find fonts \
		-maxdepth 1 \
		-type f \
		-exec install -Dm 644 -t "$pkgdir/etc/tid/fonts/" {} +
	install -Dm 644 "tid.config" "$pkgdir/etc/tid/tid.config"

	install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
