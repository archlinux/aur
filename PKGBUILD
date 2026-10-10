# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=rawmakase
pkgver=0.2.4
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
_archive="$pkgname-$pkgver"
options=(!lto)
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('e1fc5e0d6c79108d1311cfbd9f2e205c7813996e6bce7f7bab35888f1d595bd9')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -fno-lto'
	CPPFLAGS+=' -fno-lto'
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
