# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs
pkgver=0.1.5
pkgrel=1
pkgdesc="A work-in-progress reimplementation of a JPEG XL decoder in Rust, aiming to be conforming, safe, and fast."
arch=(x86_64)
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'lcms2' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20d45c77ffde60a609c2466cb7e4422308a53f3b7901530e3c304433ca466dd3')

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
