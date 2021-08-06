# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=scribl
pkgver=0.3.2
pkgrel=1
pkgdesc='make simple instructional videos'
arch=(x86_64)
url="https://github.com/jneem/$pkgname"
license=(Apache)
depends=(gst-plugins-base-libs
         gtk3)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f88ffdb14c1b49947b13923f9a411c96c2efaa9f40c816af84ab562a7981d228')

prepare() {
	cd "$_archive"
	# Upstream Issue: https://github.com/jneem/scribl/issues/11#issuecomment-894316482
	cargo update
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
}
