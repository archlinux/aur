# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-igitt
pkgver=0.1.18
pkgrel=1
pkgdesc='TUI with clear git graphs arranged for your branching model'
url="https://github.com/mlange-42/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(dbus
         gcc-libs
         glibc)
makedepends=(cargo
             clang)
checkdepends=(git)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('5405d07bdfb98fe6068af7fc7a5ae098ed350c0517ad4220da26bb8616d8b8d4')

prepare() {
	cd "$_archive"
	cargo update
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
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=()
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
