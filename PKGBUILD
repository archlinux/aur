# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs-git
pkgver=0.4.3.r10.gc5528f6
pkgrel=1
pkgdesc="This is a work-in-progress, and currently incomplete reimplementation of a JPEG XL decoder in Rust, which aims to be conforming, safe and fast."
arch=('x86_64')
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'lcms2')
makedepends=('cargo' 'git')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}


prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	export CXXFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/jxl_cli "$pkgdir/usr/bin/jxl_cli"
	install -Dm755 target/release/jxlinspect "$pkgdir/usr/bin/jxlinspect"
	install -Dm755 target/release/libjxl_macros.so "$pkgdir/usr/lib/libjxl_macros.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 PATENTS "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}
