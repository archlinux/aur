# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='a description language for modeling parameterizable geometric objects'
pkgname=microcad
pkgver=0.2.17
pkgrel=1
url="https://codeberg.org/$pkgname/$pkgname"
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(gcc-libs
         glibc
         manifold)
makedepends=(cargo
             cmake
             git
             ninja)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dbc6dd4eb9d3645b582ee37b1c2af8edacdca508aa6643895298cb008fb0738f')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	sed -i -e '/tests/d' Cargo.toml
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
