# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=git-branch-stash
pkgdesc='Git add-on to manage snapshots of branch status'
pkgver=0.11.2
pkgrel=1
url=https://github.com/gitext-rs/git-branch-stash
arch=(x86_64)
license=(Apache-2.0 MIT)
depends=(git gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('971f438dfd90189e1c53128fc6f13dc5ec8a9482d32c83fe513e9cc5bd6394c9')

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
