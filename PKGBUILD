# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=git-stack
pkgdesc='Stacked branch management for Git'
pkgver=0.10.19
pkgrel=1
url=https://github.com/gitext-rs/git-stack
arch=(x86_64)
license=(Apache-2.0 MIT)
depends=(git gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5823ac8de5340a3f53936054dd8397676fce0a9978daec3221d7e8724594c559')

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
