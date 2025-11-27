# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=wrkflw
pkgver=0.7.3
pkgrel=1
pkgdesc='validate and execute GitHub Actions workflows locally'
url="https://github.com/bahdotsh/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(gcc-libs
         glibc
         openssl libcrypto.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('475acd61bff0b6ee4ec58aa566b442355e88d9efe18267c58c1501f3fb93f4bc')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

_srcenv() {
	cd "$_archive"
	CFLAGS+=' -ffat-lto-objects'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export OPENSSL_NO_VENDOR=true
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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
