# Maintainer: Caleb Maclennnan <caleb@alerque.com>

pkgname=dotslash
pkgver=0.2.0
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
sha256sums=('bb7212a13248474232c0b23c94bc1736b5653094b87c817d9b32c0dcbd8fba26')

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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}
