# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=anydoc
pkgver=0.2.5
pkgrel=1
pkgdesc='Convert Word, PowerPoint, Excel, OpenDocument, RTF, EPUB, CSV, and PDF to clean Markdown'
arch=(x86_64)
url="https://github.com/firecrawl/$pkgname"
license=(MIT)
depends=(glibc # jklibc.so
         libgcc
         zstd)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('9feb89cb8ffdf93ae5aff36d8c0330be36f485e1d0e5252a867e985ee677002f')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export ZSTD_SYS_USE_PKG_CONFIG=1
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
	depends+=(libgcc_s.so
	          libzstd.so)
	cd "$_archive"
	install -Dm0755 "target/release/examples/convert" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
