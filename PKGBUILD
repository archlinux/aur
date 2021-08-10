# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark-git
_pkgname=${pkgname%-git}
pkgver=0.8.0.r42.g4d5094b
pkgrel=2
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=(x86_64 i686)
url="https://github.com/raphlinus/$_pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package () {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/$_pkgname
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
