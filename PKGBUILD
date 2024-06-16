# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=kipr
pkgver=0.4.0
pkgrel=3
pkgdesc='Command Line Password Manager'
url='https://github.com/grahamking/kipr'
license=('MIT')
arch=('any')
source=("https://github.com/grahamking/kipr/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=(cargo)
depends=("gnupg")
optdepends=('xclip: Clipoard functionality')
sha256sums=('a4ce0a5563f0a620679681645b451a26b732f3b531baf0b60aafbc947291fcb1')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
