# shellcheck disable=all
# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# Maintainer: Guillermo Galavis <druxorey@proton.me>

pkgname=tetro-tui
pkgver=3.5.2
pkgrel=6
pkgdesc="A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform. "
arch=('x86_64' 'aarch64')
url="https://github.com/Strophox/tetro-tui"
license=('MIT')
depends=()
makedepends=('rust')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('237911e290f821f2f8f294462459da1e520f448821fe6467e4cda4e4a8e732e66d563e355a2898b89f444ead0041f9616edb18a62fb0393227e3de544ad90f87')
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
