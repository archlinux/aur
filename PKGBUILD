# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lungo
pkgver=1.0.1
pkgrel=2
pkgdesc="A simple systray applet to prevent your system from going idle or suspending on demand"
url="https://github.com/Antiz96/lungo"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'systemd' 'hicolor-icon-theme')
makedepends=('cargo' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c1e9aeed0a0adf4b4781707b6d40814921daacb5b5e9a80d0b0a847b99f3ea4a')

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
	install -Dm 644 "res/icons/${pkgname}-off.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}-off.svg"
	install -Dm 644 "res/icons/${pkgname}-on.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}-on.svg"
	install -Dm 644 "res/desktop/${pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
	install -Dm 644 "res/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm 644 "res/completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm 644 "res/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm 644 "doc/man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
