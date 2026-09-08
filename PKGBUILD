# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs
pkgver=0.7.1
pkgrel=1
pkgdesc="A high-performance, conforming, and memory-safe JPEG XL decoder written in Rust."
arch=(x86_64)
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d197c87d7ddbadde4a37ce7eb92d2c1b175bc56952877324940afee15b4432f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	for file in jxl_cli jxlinspect
	do
		install -Dm755  target/release/$file "$pkgdir/usr/bin/$file"
	done
	install -Dm755 target/release/libjxl_macros.so -t "$pkgdir/usr/lib"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
