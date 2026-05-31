# shellcheck disable=all
# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# Maintainer: Guillermo Galavis <druxorey@proton.me>

pkgname=tetro-tui
pkgver=3.6.1
pkgrel=7
pkgdesc="A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform. "
arch=('x86_64' 'aarch64')
url="https://github.com/Strophox/tetro-tui"
license=('MIT')
depends=()
makedepends=('rust')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8e8e98a303c562e5e00d6e1eeaace7cf9cf7f898c2659ddb67c1cdae677bcd3c9a39bf6d67c3b280abcadf1351a7e50814a9c4c934364ba82758aa86a52717e6')
options=('!debug')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	[ -f LICENSE ]   && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	[ -f README.md ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
