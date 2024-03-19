# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chromazone
pkgver=1.0.1
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
sha256sums=('ebbdc5e3bc6e2dee27cce659ef583a10fc232ec783d3491d306b17876e33da48')

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
