# Maintainer: witcher <witcher@wiredspace.de>

pkgname="helpaur"
pkgver=v0.1.0
pkgrel=1
pkgdesc="Help maintaining the AUR by listing unmaintained packages"
arch=('x86_64')
url="https://sr.ht/~witcher/$pkgname"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~witcher/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('36f1ecfff1da739f49d63065d52d6c13b66a771c0a45342ee3fd3302d0ae664d')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
		"LICENSES/GPL-3.0-only.txt" "LICENSES/CC0-1.0.txt"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
