# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=rawmakase
pkgver=0.9.0
pkgrel=1
url="https://$pkgname.com/"
_url="https://github.com/pch/$pkgname"
pkgdesc='Lightroom-compatible RAW photo editor'
arch=(x86_64)
license=(MIT)
depends=(glibc # libc.so libm.so
         libgcc
         libraw)
makedepends=(cargo)
options=(!lto)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('4cf1b59f3baff521c2174058f2494f89e27fd4cc2a28c7641393e0d5b519becd')

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
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -ffat-lto-objects'
	CPPFLAGS+=' -ffat-lto-objects'
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
