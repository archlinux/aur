# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aroum
_gitname=che
_appname=che
_appalias=ch
pkgname=${_appname}
pkgdesc="💥 Blazing fast terminal file manager written in Rust, based on async I/O with true dual panel mode"

pkgver=26.8.28
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}" "${_appalias}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4bd1c50fd83ae5536b4468b983b8a6953155898ab86e6de10b0cdc5271e53315')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "target/release/${_appalias}" "${pkgdir}/usr/bin/${_appalias}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

