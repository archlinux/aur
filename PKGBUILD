# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=oniri
pkgver=1.2.1
pkgrel=1
pkgdesc="A tool that automatically maximizes the only window of a niri workspace"
url="https://github.com/Antiz96/oniri"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'niri')
makedepends=('cargo' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0a726b6937031dfc2d24720d5665043b7e5ee897e101c34e9143640a4644d77b')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	scdoc < "doc/man/${pkgname}.1.scd" > "doc/man/${pkgname}.1"
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm 644 "res/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm 644 "res/completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm 644 "res/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm 644 "doc/man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
