# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='a description language for modeling parameterizable geometric objects'
pkgname=microcad
pkgver=0.4.0
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
sha256sums=('98be18aa2691df9708aed34776e0a13cb7aaf9ad33f1ef6af568ef7f0b7fa968')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
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
