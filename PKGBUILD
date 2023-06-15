# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=typst-lsp
pkgver=0.7.2
pkgrel=1.1
pkgdesc='Language server for Typst'
arch=(i686 x86_64)
url="https://github.com/nvarner/$pkgname"
license=(Apache MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('45023dc67276b87856ce5189ae904f408162521dde390d302ca01a928765ca08')


prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test  --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 "LICENSE-MIT.txt" -t "$pkgdir/usr/share/licenses/typst-lsp"
}
