# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-oxide
pkgver=0.12.4
pkgrel=1
pkgdesc="Pure Rust implementation of JPEG XL decoder"
arch=('x86_64')
url="https://github.com/tirr-c/jxl-oxide"
license=('Apache-2.0 AND MIT')
depends=('glibc' 'gcc-libs' 'lcms2' 'ffmpeg')
makedepends=('cargo')
provides=()
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('535d0b8ef739c4d76a0630ef708d4151c3fb36e73b329f61a81088d22493e7a4')

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
