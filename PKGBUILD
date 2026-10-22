# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs
pkgver=0.8.0
pkgrel=1
pkgdesc="A high-performance, conforming, and memory-safe JPEG XL decoder written in Rust."
arch=(x86_64)
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8dbb0d1654f404ba62df18c0a9ca768d67130e1b98760ae2625d9e5b4b1041a0')

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
