# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=audium
pkgname=${_appname}
pkgver=1.1.0
pkgrel=1
pkgdesc="A keyboard-driven music app for people who live in the terminal."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'alsa-lib')
makedepends=('rust' 'cargo')

source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums_x86_64=('1d7798334958574be787922e110a115686b3c99a7b366af4d4582424e2001c53')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
