# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ctrdecrypt
pkgver=1.1.0
pkgrel=1
pkgdesc="Decrypt module for cia-unix"
arch=('x86_64' 'aarch64')
url="https://github.com/shijimasoft/ctrdecrypt"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5ed94367b029f2c61ae82e2bb48710a8bec842ff1228fdf54b90f0f65fe9071')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
