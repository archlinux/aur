# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=novel-cli
pkgver=0.3.1
pkgrel=0
pkgdesc='tool for downloading novels from the web, manipulating text, and generating EPUB '
arch=(x86_64)
url='https://github.com/novel-rs/cli'
license=(Apache MIT)
depends=(gcc-libs)
makedepends=(cargo
             clang
             cmake)
_archive="cli-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('01dca1b084488b455d8355bbfeea783d68b8a795d7166c82f0eef70daaa5e7e7')

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
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{MIT,APACHE}
}
