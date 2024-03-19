# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chromazone
pkgver=1.0.0
pkgrel=1
pkgdesc='A terminal colorizer'
arch=(x86_64)
url="https://github.com/matze/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('3cea4dc67dfb4838eb63422985cd42945855bc288dc55054ee0d2f0e4d5de631')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
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
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/cz
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
