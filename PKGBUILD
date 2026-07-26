# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=audium
pkgname=${_appname}
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal music app: keyboard-driven, for people who live in the command line."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('GPL-3.0-or-later')

provides=("${_appname}")

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'alsa-lib')

source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums_x86_64=('28415945ad9c784bfd6a3a63b2715f7956125d5731667cfd640ef29fbde6fd65')

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
