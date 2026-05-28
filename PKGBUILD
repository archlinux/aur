# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=regname
pkgver=0.2.0
pkgrel=1
pkgdesc='mass renamer TUI written in Rust'
arch=(x86_64)
url="https://github.com/linkdd/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4ba8a0ea79ff314880368d17bc9837ef04918f2d6352d4350d70e07583654243')

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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
