# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=julesklord
_gitname=mangofetch
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Tool for fetch everythin' in internet"

pkgver=0.7.4
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'xz')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_gitversion}.tar.gz"
		"${_appname}.desktop")
sha256sums=('bb0a5f32eb71712909781bbefbc2a4601e724a06038707be783c30a0ffcb72f4'
            'ae922cb150cbec60cebb3b46423396d452e02f62dfafb88952fe19aaf0381bc7')


prepare() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	msg2 "Building CLI"
	cargo build --release -p "${_appname}-cli"

	msg2 "Building GUI"
	cargo build --release -p "${_appname}-gui"
}

check() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	# export MANGOFETCH_OFFLINE=1
	# cargo test -p mangofetch-core

	./target/release/${_appname} about
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "target/release/${_appname}-gui" "${pkgdir}/usr/bin/${_appname}-gui"

	install -Dm644 "../${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "docs/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
