# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tylax
pkgver=0.3.5
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
sha256sums=('881cb14e1afeaca5bd937634fc2105a21ac224c0dcf5e83fd6ebc49b233a67c3')

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
