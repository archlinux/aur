# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=gotatun
pkgname=(gotatun libgotatun)
pkgver=0.9.2
pkgrel=1
pkgdesc="Userspace WireGuard® Implementation in Rust"
arch=('x86_64')
url="https://github.com/mullvad/gotatun"
license=('BSD-3-Clause AND MPL-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('4ef8cf5af62a3e52667aad1e3fa3a9c53636d6cbd270f76f3df6282629445568')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgbase-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" #--locked
}

build() {
	cd "$srcdir/$pkgbase-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package_gotatun() {
	cd "$pkgbase-$pkgver"
	install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MPL-2.0"
	install -Dm644 LICENSE-CLOUDFLARE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD-3-Clause"
}

package_libgotatun() {
	cd "$pkgbase-$pkgver"
	install -Dm755 target/release/${pkgname}.so "$pkgdir/usr/lib/${pkgname}.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MPL-2.0"
	install -Dm644 LICENSE-CLOUDFLARE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD-3-Clause"
}
