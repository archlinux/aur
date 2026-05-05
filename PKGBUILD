# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tylax
pkgver=0.3.6
pkgrel=1
pkgdesc='A bi-directional converter between Typst and LaTeX'
arch=(x86_64)
url="https://github.com/scipenai/$pkgname"
license=(Apache-2.0)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2573e8286f9cee4b57be475e52922a828490c8f53cd63f66cbc8d57bd9a87d2e')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/t2l"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
