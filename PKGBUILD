# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=wrkflw
pkgver=0.3.0
pkgrel=2
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
sha256sums=('d8f2652587317c07dbb146654955774edd61b79abf9232b261ba0641d0da90d4')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
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
