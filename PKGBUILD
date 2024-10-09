# Maintainer: Nikl <nikl174@mailbox.org>
pkgname=aur_helper
pkgver=0.2.0
pkgrel=3
pkgdesc="a simple aur_helper used to manage a AUR-Directory"
arch=('any')
url="https://github.com/Nikl174/simple_aur_helper"
license=('BSD')
depends=('pacman' 'git' 'sudo')
makedepends=(
	'cargo'
)
source=("https://github.com/Nikl174/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b43ff47df34aed4ce9f48bcce3e19b0537d0a70b02cf5719f8d80993402e7dec')
prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

}
build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}
package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/share/zsh/site-functions/" "completion/_$pkgname"
}
