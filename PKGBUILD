# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-oxide
pkgver=0.11.3
pkgrel=1
pkgdesc="Pure Rust implementation of JPEG XL decoder"
arch=('x86_64')
url="https://github.com/tirr-c/jxl-oxide"
license=('Apache-2.0 AND MIT')
depends=('glibc' 'gcc-libs' 'lcms2' 'ffmpeg')
makedepends=('cargo')
provides=()
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9492c2542b1116168c805737844780d5509b7afbe129f956499f6ccd9eeba412')

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
