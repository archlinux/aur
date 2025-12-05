# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=val
pkgver=0.3.6
pkgrel=1
pkgdesc='an arbitrary precision calculator language'
url="https://github.com/terror/$pkgname"
arch=(x86_64)
license=(CC0-1.0)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('c3a19b91a83829709af2bf773c034361beb01b1cc7f5fa392a44f94579647ff7')

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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
