# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=rilua
pkgver=0.1.17
pkgrel=1
pkgdesc='A zero-dependency Rust port of Lua 5.1.1'
arch=(x86_64 i686)
url="https://github.com/wowemulation-dev/$pkgname"
license=(MIT Apache-2.0)
depends=(gcc-libs libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1d1a721d4edefc03df44fdf32a03220fd691a3eec267d03e721675e578976a53')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
