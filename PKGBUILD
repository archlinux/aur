# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-oxide
pkgver=0.12.6
pkgrel=1
pkgdesc="Pure Rust implementation of JPEG XL decoder"
arch=('x86_64')
url="https://github.com/tirr-c/jxl-oxide"
license=('Apache-2.0 AND MIT')
depends=('glibc' 'libgcc' 'lcms2')
makedepends=('cargo')
provides=()
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d4ddd94b8d9c5d34424e3e228e07a5399aee9a388339fd6cd81b073eebf1e6de')

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
	cargo build --frozen --release #Temp disabled ffmpeg cause it won't compile
}

package() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm655 "$srcdir/$pkgname-$pkgver"/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
}
