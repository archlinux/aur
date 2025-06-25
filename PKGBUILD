# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: SelfRef <arch@selfref.dev>

pkgname=ms-edit
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple editor for simple needs (Microsoft Edit)"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/edit"
license=('MIT')
makedepends=('cargo-nightly')
depends=('gcc-libs' 'glibc')
source=("https://github.com/microsoft/edit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4ba6ff1bfecfeff2492306f5850c714bf50ffdb3cc3bb5be3aa987289f240fe')

prepare() {
	cd "$srcdir/${pkgname:3}-${pkgver}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/${pkgname:3}-${pkgver}"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/${pkgname:3}-${pkgver}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/${pkgname:3}-${pkgver}"
	install -Dm755 "target/release/edit" "$pkgdir/usr/bin/ms-edit"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
