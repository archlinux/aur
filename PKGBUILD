# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.23.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/$pkgname"
license=(BSD)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('e291ac08a699cc6c4afb79f3dd23ee1b453dfd66d1c86af5d71889e25a458830')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
