# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.54.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/$pkgname"
license=(BSD-2-Clause)
depends=(glibc # libc.so libm.so 
         libgcc libgcc_s.so
	 oniguruma) # libonig.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('af8d045d68a237f6733d05e998e7e5ad9125c93fa101edca75d8065271e5ac2c')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CFLAGS+=' -ffat-lto-objects'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTONIG_DYNAMIC_LIBONIG=1
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	local skipped=()
	cargo test --frozen --all-features -- ${skipped[@]/#/--skip }
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
