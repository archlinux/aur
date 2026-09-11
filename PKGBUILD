# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs
pkgver=0.7.2
pkgrel=1
pkgdesc="A high-performance, conforming, and memory-safe JPEG XL decoder written in Rust."
arch=(x86_64)
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d87264da56743db4656fe53149fd4b60aa3747facd30e9be63e89ed797fdd91')

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
