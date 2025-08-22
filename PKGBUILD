# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=wrkflw
pkgver=0.7.1
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
sha256sums=('3d972f95f56e73f803d0d998674befa97c7e620885c0e81fe131ff6cbabf6bf4')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
