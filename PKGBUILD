# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sassman
_gitname=putzen-rs
_appname=${_gitname%-rs}
pkgname=${_appname}
pkgver=3.3.2
pkgrel=1
pkgdesc="It helps keeping your disk clean of build and dependency artifacts safely."

arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/${_gitauthor}/${_gitname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e2676268f50df6f7288a0c0c7a7ce14f4d09877f8a2e023e435ea192b1f87faa')

prepare() {
	cd "${_gitname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_gitname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${_gitname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${_gitname}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "$pkgdir/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
