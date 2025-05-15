# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=git-stack
pkgdesc='Stacked branch management for Git'
pkgver=0.10.18
pkgrel=1
url=https://github.com/gitext-rs/git-stack
arch=(x86_64)
license=(Apache-2.0 MIT)
depends=(git libgit2)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46786c7509ba27a36225835aa8689445b6249d6491cf104f5a0168f8edd7ab89')

prepare () {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix '$srcdir=src'"
	cargo build --frozen --release
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
