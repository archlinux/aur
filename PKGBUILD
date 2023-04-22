# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teracli
_pkgname=tera-cli
pkgver=0.2.4
pkgrel=1
pkgdesc='A utility on top of the tera templating engine, takes json|yaml|toml|ENV as input'
arch=(x86_64)
url="https://github.com/chevdor/$_pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
conflicts=($_pkgname) # different project
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('30e701aff463c582f816bd3c25d7a57751f8e2cac5d91ad04d001e964f2df255')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tera"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
