# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yage
pkgver=0.5.0
pkgrel=1
pkgdesc='manage encrypted secrets in YAML files with age encryption'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/glehmann/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('76a7a8bd546622b02896e9cdc585fe4bbfdf7fdddf8218a73c748740966474ca')

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
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
