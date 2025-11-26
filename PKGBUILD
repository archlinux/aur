# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitopolis
pkgver=1.12.4
pkgrel=1
pkgdesc='CLI tool to manage multiple git repositories; run commands, clone, and organize repos with tags'
arch=(x86_64)
url="https://github.com/timabell/$pkgname"
license=(AGPL-3.0-only)
depends=(gcc-libs
         glibc
         libgit2 libgit2.so
         openssl libcrypto.so libssl.so)
makedepends=(cargo)
checkdepends=(git)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('00a2e2935a7461ed979aade1af946f57fae24004e3558798b38a5669f238efca')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export LIBGIT2_NO_VENDOR=1
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	export OPENSSL_NO_VENDOR=true
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
