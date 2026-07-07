# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='TUI Bible reader'
pkgname=christ-cli
pkgver=0.6.1
pkgrel=1
url="https://github.com/whoisyurii/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(libgcc libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9e53924e336a0488da0905f36685711132e0159e1a59f150d20445dc15519139')

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
