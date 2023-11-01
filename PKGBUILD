# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typst-lsp
pkgver=0.11.0
pkgrel=1
pkgdesc='Language server for Typst'
arch=(i686 x86_64)
url="https://github.com/nvarner/$pkgname"
license=(Apache MIT)
depends=(gcc-libs
         glibc
         libcurl.so
         libcrypto.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e1e1386caaa5118baa889f5069f9fb89d2fffddf4ce46f46e10aaea2dfaf217d')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/typst-lsp/" "LICENSE-MIT.txt"
}
