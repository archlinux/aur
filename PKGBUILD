# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=litua
pkgver=1.1.1
pkgrel=1
pkgdesc='Read a text document, receive its tree in Lua and manipulate it'
arch=(x86_64)
url="https://github.com/typho/$pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('99188b027de0274444e1b7cdf7518dcb153470164f338a2b8c729ef3f3ab60fa')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
