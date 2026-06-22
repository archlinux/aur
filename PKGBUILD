# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=manora-git
_pkgname="${pkgname%-git}"
pkgver=2.0.1.r182.af240e6
pkgrel=1
pkgdesc="A simple CLI / TUI tool to display (or save) man pages as PDF files (git version)"
url="https://github.com/Antiz96/manora"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'man' 'groff' 'xdg-utils')
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
	install -Dm 644 "res/completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm 644 "res/completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm 644 "res/completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm 644 "doc/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
