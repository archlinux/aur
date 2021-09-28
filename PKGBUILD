# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=krankerl
pkgver=0.13.2
pkgrel=2
pkgdesc='A CLI helper to manage, package, and publish Nextcloud apps'
arch=(x86_64)
url="https://github.com/ChristophWurst/$pkgname"
license=(GPL3)
depends=(gcc-libs
         glibc
         libgit2
         libgit2.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f4f95df36c0a64a4183f39203d3d08b3be256be8fe0480ad87ed90a17e436460')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	local CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
