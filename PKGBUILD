# Maintainer: Caleb Maclennnan <caleb@alerque.com>

pkgname=dotslash
pkgver=0.5.4
pkgrel=1
pkgdesc='Simplified executable deployment'
arch=(x86_64)
url="https://github.com/facebook/$pkgname"
license=(Apache-2.0 MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('92e8f39796931436e122e6c57bfd49d2050eae07d800a920ce2bf52238c1ff02')

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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}
