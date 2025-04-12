# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=apollo-rover
_pkg=rover
pkgver=0.28.1
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
replaces=('apollo-rover-fed2')
options=('!lto')
install=rover.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a939f21b5bff0fb255b39593182f6a2f3df1c5d47ce63186616f069a5a2c4c63')

prepare() {
	cd "$_pkg-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$_pkg-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$_pkg-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$_pkg-$pkgver"
	install -Dv "target/release/$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
