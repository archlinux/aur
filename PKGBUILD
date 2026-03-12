# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='TUI Bible reader'
pkgname=christ-cli
pkgver=0.5.2
pkgrel=1
url="https://github.com/whoisyurii/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(libgcc libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('48bf8d5b6a8e0d0f41e8b5c655bb908479c07ef3e3e573a4b184acc33c0d40bd')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-cli}"
}
