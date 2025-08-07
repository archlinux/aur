# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=git-stack
pkgdesc='Stacked branch management for Git'
pkgver=0.10.20
pkgrel=1
url=https://github.com/gitext-rs/git-stack
arch=(x86_64)
license=(Apache-2.0 MIT)
depends=(git gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2a1558b2016c5e310811ff83ae9088730e403c46f651b4c648ab6e41ec9d12d1')

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
