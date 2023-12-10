# Maintainer: Marieke Westendorp <ma3ke.cyber@gmail.com>
pkgname=tid
pkgver=0.0.3
pkgrel=1
pkgdesc="A small system information bar"
arch=('x86_64')
url="https://git.sr.ht/~ma3ke/tid"
license=('MIT')
depends=()
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
backup=("etc/tid/tid.conf")
sha512sums=('a5b7450b2210430daa7885d2b8b84cd6c3e6d388ad201dc469bf7523d742499a41825ce4a41e2ff575dc4c18c4e9f2400c2fdc6ca1dbaad04371f0f3d7d227ca')

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
