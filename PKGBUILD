# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=manora
pkgver=2.2.5
pkgrel=1
pkgdesc="A simple CLI & TUI tool to display, download and save man pages as PDF files"
url="https://github.com/Antiz96/manora"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'man' 'groff' 'xdg-utils' 'util-linux')
makedepends=('cargo' 'scdoc')
optdepends=("zathura: fallback PDF reader"
            "zathura-pdf-poppler: PDF support for zathura (poppler backend)"
            "zathura-pdf-mupdf: PDF support for zathura (mupdf backend)")
options=(!lto) # aws-lc crates cause linking errors
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('168024fed2b5a5b7ddd79fd221507b34efc6e79593b61cd1dbdc4b1f037c9e3f')

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
