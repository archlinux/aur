# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=gotatun
pkgname=(gotatun libgotatun)
pkgver=0.8.0
pkgrel=1
pkgdesc="Userspace WireGuard® Implementation in Rust"
arch=('x86_64')
url="https://github.com/mullvad/gotatun"
license=('BSD-3-Clause AND MPL-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7cf0fce9b13bf663dbe85d25709b00e6668fb39721d63d8f745b00606c6a26ba')
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
	install -Dm644 LICENSE-CLOUDFLARE "$pkgdir/usr/share/licneses/$pkgname/LICENSE-BSD-3-Clause"
}

package_libgotatun() {
	cd "$pkgbase-$pkgver"
	install -Dm755 target/release/${pkgname}.so "$pkgdir/usr/lib/${pkgname}.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MPL-2.0"
	install -Dm644 LICENSE-CLOUDFLARE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD-3-Clause"
}
