# Maintainer: Marieke Westendorp <ma3ke.cyber@gmail.com>
pkgname=tid
pkgver=0.1.0
pkgrel=1
pkgdesc="A small system information bar"
arch=('x86_64')
url="https://git.sr.ht/~ma3ke/tid"
license=('MIT')
depends=()
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
backup=("etc/tid/tid.conf")
sha512sums=('b8687f4a5f7ef3f63241f348352d0fb3a0a77338761e333bbdced19020a13a5c2de308146e5224988c57603d3e5de27cc969318779093615600175ed09f177a6')

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
