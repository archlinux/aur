# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lukaj
pkgver=0.2.0
pkgrel=1
epoch=1
pkgdesc='Interactive diff tool for SVG images'
arch=(x86_64)
url="https://github.com/adamws/$pkgname"
license=(GPL-3.0-only)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('045ad280e7baa5f74f0f55840730cc526cc69916102a8eeded820787fec0c785')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
