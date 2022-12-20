# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christoph Wurst <christoph@winzerhof-wurst.at>

pkgname=krankerl
pkgver=1.14.0
pkgrel=1
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
sha256sums=('11dcb138c4a978d19cbc17ef50d6c50aba7b28664089cdc93ae697827349d1c2')

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
