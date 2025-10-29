# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=matugen
pkgver=3.0.0
pkgrel=1
pkgdesc='A material you color generation too '
arch=(x86_64)
url="https://github.com/InioX/$pkgname"
license=(GPL-2.0-only)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6756fa0e5014871924e1e99df37ceda72a1589f5299753765e8cd012a8c86886')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
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
