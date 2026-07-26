# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=swagsh
pkgname=${_appname}
pkgver=0.8.0
pkgrel=1
pkgdesc="A fast, minimal, modern Linux shell. Named after swag, slang for stylish flair."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('GPL-3.0-or-later')

provides=("${_appname}")

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc')

install=${_appname}.install

source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums_x86_64=('ec5f8ce70660b279d059cd7431777e856b2ac729d8af7ac144f9b54549c8f124')

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
