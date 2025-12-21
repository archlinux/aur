# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=gotatun
pkgver=0.1.0
pkgrel=1
pkgdesc="Userspace WireGuard® Implementation in Rust"
arch=('x86_64')
url="https://github.com/mullvad/gotatun"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('ae35a8f82087d362c784880fadf3919da262ce6cf4d2816d1897934439cbd27a')
validpgpkeys=()

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
	install -Dm755 target/release/${pkgname}-cli "$pkgdir/usr/bin/${pkgname}-cli"
	install -Dm755 target/release/lib${pkgname}.so "$pkgdir/usr/lib/lib${pkgname}.so"
}
