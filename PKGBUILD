# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs
pkgver=0.4.3
pkgrel=1
pkgdesc="A work-in-progress reimplementation of a JPEG XL decoder in Rust, aiming to be conforming, safe, and fast."
arch=(x86_64)
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfa89fad85becdd63b0f5966d9877fa820a740dd3402fb90761e3eca81c5f9cb')

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
