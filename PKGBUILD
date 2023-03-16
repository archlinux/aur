# Maintainer: Duncan Russell <duncan at anomalocaris dot xyz>

pkgname=handlr-regex
pkgver=0.8.3
pkgrel=1
pkgdesc="Fork of handlr with regex support"
arch=('x86_64')
url="https://github.com/Anomalocaridid/handlr-regex"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=(handlr)
conflicts=(handlr)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('a5d8eabe54753004e49486c98b8456d537fe674feabb4c7354f04a909dbec5b09e1a3549d4bc32d0ecc27544c9f69e07d07830c32d674025257a564cba4597f6')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/handlr" -t "${pkgdir}/usr/bin"
	install -Dm 755 "assets/completions/handlr" -t "${pkgdir}/usr/share/bash-completion/completions"
	install -Dm 755 "assets/completions/handlr.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
	install -Dm 755 "assets/completions/_handlr" -t "${pkgdir}/usr/share/zsh/site-functions"
	install -Dm 644 assets/manual/man1/* -t "${pkgdir}/usr/share/man/man1"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
