# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=dfallman
_gitname=spritz
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A multiplatform, nano DLNA media server for the terminal"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('591956fc7c3f2cdc9f6633c20bf96ede0480e3efed664ad28ba4afada218c849')


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

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
