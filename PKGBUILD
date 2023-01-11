# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christoph Wurst <christoph@winzerhof-wurst.at>

pkgname=krankerl
pkgver=0.14.0
pkgrel=1
epoch=1
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
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('045ad280e7baa5f74f0f55840730cc526cc69916102a8eeded820787fec0c785')

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
