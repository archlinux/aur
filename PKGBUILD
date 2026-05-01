# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitopolis
pkgver=1.17.1
pkgrel=1
pkgdesc='CLI tool to manage multiple git repositories'
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
sha256sums=('a1649c5ff3deeb78f6b438d235188d33d65b110f6ced1fd55492ba961874df25')

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
