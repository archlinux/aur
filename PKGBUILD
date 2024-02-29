# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grass-sass
_pkgname=${pkgname%-*}
pkgver=0.13.2
pkgrel=1
pkgdesc='a SASS compiler written purely in Rust to replace dart-css'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/connorskees/$_pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
conflicts=("$_pkgname")
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('5436fb9b0e633db65be6ad42240c85a150f68858d82c5909bef0cca6ca403fcb')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
