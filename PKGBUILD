# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lungo-git
_pkgname="${pkgname%-git}"
pkgver=1.0.2.r16.7e7dd53
pkgrel=1
pkgdesc="A simple systray applet to prevent the system from going idle or suspending on demand (git version)"
url="https://github.com/Antiz96/lungo"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'systemd' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'scdoc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
	scdoc < "doc/man/${_pkgname}.1.scd" > "doc/man/${_pkgname}.1"
}

check() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${_pkgname}"
	install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 "res/icons/${_pkgname}-off.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}-off.svg"
	install -Dm 644 "res/icons/${_pkgname}-on.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}-on.svg"
	install -Dm 644 "res/desktop/${_pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${_pkgname}.desktop"
	install -Dm 644 "res/completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm 644 "res/completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm 644 "res/completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm 644 "doc/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm 644 THIRD-PARTY-NOTICES.md "${pkgdir}/usr/share/licenses/${_pkgname}/THIRD-PARTY-NOTICES.md"
}
