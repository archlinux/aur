# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tenere
pkgver=0.11.1
pkgrel=1
pkgdesc='TUI interface for LLMs written in Rust'
arch=(x86_64)
url="https://github.com/pythops/$pkgname"
license=(GPL-3.0-only)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('aa6dc7872646953d4788c2471fb51cd85a00473d47d86b1825868c9faf024416')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
