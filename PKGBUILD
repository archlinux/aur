# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=anydoc
pkgver=0.1.8
pkgrel=1
pkgdesc='Convert Word, PowerPoint, Excel, OpenDocument, RTF, EPUB, CSV, and PDF to clean Markdown'
arch=(x86_64)
url="https://github.com/firecrawl/$pkgname"
license=(MIT)
depends=(glibc # jklibc.so
         libgcc libgcc_s.so
         zstd libzstd.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('9a9d2ea3b070c4bb6652b5f771ce5f1077ff600a9114ce86eadeb3f2c1e1f3e6')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-fto'
	export ZSTD_SYS_USE_PKG_CONFIG=1
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --example convert
}

check() {
	_srcenv
	cargo test --frozen
}

package() {
	cd "$_archive"
	install -Dm0755 "target/release/examples/convert" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
