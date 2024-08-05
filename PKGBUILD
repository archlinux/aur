# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grass-sass
_pkgname=${pkgname%-*}
pkgver=0.13.4
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
sha256sums=('577858cce48440d161c6036d83dbfb3c173058f9df297977b13b8646f88a4906')

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
