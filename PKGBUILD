# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=litua
pkgver=2.0.0
pkgrel=1
pkgdesc='Read a text document, receive its tree in Lua and manipulate it'
arch=(x86_64)
url="https://github.com/typho/$pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7d3405521ea5b132c731dc69275c2eb6572b0652553f0bf2405fb87264e0c861')

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
