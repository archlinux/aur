# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-rs-git
pkgver=r347.dc0fe7c
pkgrel=1
pkgdesc="This is a work-in-progress, and currently incomplete reimplementation of a JPEG XL decoder in Rust, which aims to be conforming, safe and fast."
arch=('x86_64')
url="https://github.com/libjxl/jxl-rs"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs' 'lcms2')
makedepends=('cargo' 'git')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
