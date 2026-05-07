# shellcheck disable=all
# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# Maintainer: Guillermo Galavis <druxorey@proton.me>

pkgname=tetro-tui
pkgver=3.4.0
pkgrel=5
pkgdesc="A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform. "
arch=('x86_64' 'aarch64')
url="https://github.com/Strophox/tetro-tui"
license=('MIT')
depends=()
makedepends=('rust')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('44467aad65195c1f61ffedfe06df82bbbae03f8047e7098a862c560913f9c553ab821502d8b2116d2253552400473b5d98e299b2a665cdfae64cfc6ab999d756')
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
