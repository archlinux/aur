# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=rawmakase
pkgver=0.4.9
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
sha256sums=('d41b5aeb21901a41552f9eb383ec645d1a7df11ed456ac38b16f671ca5b58977')

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
