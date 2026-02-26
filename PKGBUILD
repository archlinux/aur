# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-rs
pkgver=0.10.0
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
sha256sums=('36d6c74dd67f12e9479881c84ff7557fa92710ea5e7088e9799ebd575d605837')

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
