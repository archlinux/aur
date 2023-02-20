# Maintainer: Duncan Russell <duncan at anomalocaris dot xyz>

pkgname=handlr-regex
pkgver=0.8.2
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
b2sums=('1e3dfe72bbc05b934a4266b387a63304a2bb4e93936430fe4eb5d227755b0e075909a99980f49d9240460db66db7a9c5db6ee62290ca6597d5bad91ae368bda8')

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
