# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=swagsh
pkgname=${_appname}
pkgver=0.6.0
pkgrel=1
pkgdesc="A sleek, high-performance Linux shell built in Rust for speed and reliability."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')
makedepends=('rust' 'cargo')

install=${_appname}.install

source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums_x86_64=('99b2cbcfa4bcfe9bfadf90fb7a6ee0cc5a075c97aefa76eda3bc80e3f3d6e1eb')

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
