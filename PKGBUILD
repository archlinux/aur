# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=matugen
pkgver=2.4.1
pkgrel=2
pkgdesc='A material you color generation too '
arch=(x86_64)
url="https://github.com/InioX/$pkgname"
license=(GPL-2.0-only)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6655bd898c30730cfc9d0e6e6689021afbcb6a24de9df3ac6344c72833b6d9fa')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
