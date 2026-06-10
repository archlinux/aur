# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teracli
_pkgname=tera-cli # upstream repo conflicts with a different project on crates.io
pkgver=0.5.1
pkgrel=1
pkgdesc='A utility on top of the tera templating engine, takes json|yaml|toml|ENV as input'
arch=(x86_64)
url="https://github.com/chevdor/$_pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
conflicts=($_pkgname)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ec5cffd2458a23f0bbd80f6394e8f42b07e9d3efd258816e726aa4909c7ccc0e')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tera"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
