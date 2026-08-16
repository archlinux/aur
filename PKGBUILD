# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=aps
pkgver=1.3.3
pkgrel=1
pkgdesc="A fast and powerful patterns searcher for AUR package sources"
url="https://github.com/Antiz96/aps"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'scdoc')
options=(!lto) # aws-lc crates cause linking errors
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('181262a250fa26817263661f28e5e1bccbe2a793a33e22a532ea5e42049a1dd6')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export AWS_LC_SYS_NO_JITTER_ENTROPY=1
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
