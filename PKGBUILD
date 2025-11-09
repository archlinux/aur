# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-oxide
pkgver=0.12.5
pkgrel=2
pkgdesc="Pure Rust implementation of JPEG XL decoder"
arch=('x86_64')
url="https://github.com/tirr-c/jxl-oxide"
license=('Apache-2.0 AND MIT')
depends=('glibc' 'gcc-libs' 'lcms2' 'ffmpeg')
makedepends=('cargo')
provides=()
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae4936ca71543da3a8880bd7edad9200dc99374560cce222d5c9a491c13dd119')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm655 "$srcdir/$pkgname-$pkgver"/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
}
