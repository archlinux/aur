# Maintainer: Marieke Westendorp <ma3ke.cyber@gmail.com>
pkgname=tid
pkgver=0.1.3
pkgrel=1
pkgdesc="A small system information bar"
arch=('x86_64')
url="https://git.sr.ht/~ma3ke/tid"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
backup=("etc/tid/tid.config")
sha512sums=('becb3807ccceabcef253a1d3354be4c5a0a3f41df49d825ee6d00a9ffc32c1d4387e7bd3fd2eac411dfdc0bfd811d838c81f14edd90255b6c56800d4600d184a')

prepare() {
	cd "$pkgname-$pkgver"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"

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
