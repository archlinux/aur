# Maintainer: Osama Albahrani <osalbahr@gmail.com>

pkgname=mirafetch
pkgver=0.1.0
pkgrel=2
pkgdesc='A Rust reimplementation of Hyfetch wih a focus on speed'
url='https://github.com/ArgentumCation/mirafetch'
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
license=('EUPL-1.2')
source=("v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b18e17093321e2801bc15bb913fafc8e4afc824357c909423952eb200c4fe79')

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
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE.md' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
