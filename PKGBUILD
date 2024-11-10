# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac
pkgver=0.2.2
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/$pkgname"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
options=(!debug !lto)
sha256sums=('2dff845defe3114bc5e9a6ab54b19f26828c9c694dc7109ea9e2722246a1ed7d')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
