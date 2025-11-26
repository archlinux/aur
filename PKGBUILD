# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=novel-cli
pkgver=0.7.7
pkgrel=1
pkgdesc='tool for downloading novels from the web, manipulating text, and generating EPUBs'
arch=(x86_64)
url='https://github.com/novel-rs/cli'
license=(Apache-2.0 MIT)
depends=(gcc-libs
         glibc
         opencc)
makedepends=(clang
             cmake
             rust
             sqlite)
checkdepends=(mdbook
              pandoc)
options=(!lto)
_archive="cli-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('c8b192f3f330f219717034f95cef701e2841c81ea82b20c713149021262a5a62')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{MIT,APACHE}
}
