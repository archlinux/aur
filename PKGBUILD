# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=msmps
_gitname=pilotty
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Daemon-managed PTY sessions for AI agents to interact with terminal applications"

pkgver=0.0.11
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc')
provides=("${_appname}")

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_gitversion}.tar.gz")
sha256sums=('2da7452ab31af7f06b41d483d5cb904b0455cdb2ce9751b9bc43edf11bce44fa')


prepare() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
