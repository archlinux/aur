# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teracli
_pkgname=tera-cli # upstream repo conflicts with a different project on crates.io
pkgver=0.5.0
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
sha256sums=('bdf45c172421330a408c31ebb9fa706a1e5276b3474e6dc3e9214277c77a959f')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
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
