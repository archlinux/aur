# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-rs
pkgver=0.15.0
pkgrel=1
pkgdesc='A Lua 5.5 interpreter written in pure Rust'
arch=(x86_64 i686)
url="https://github.com/CppCXY/$pkgname"
license=(MIT)
depends=(gcc-libs libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('d499fd242b627ef3f9e9c665dc3d8c80a90a52759f0660730736897d2844fe70')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package () {
	cd "$_archive"
	install -Dm0755 target/release/lua "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
