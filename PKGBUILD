# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=NVSRahul
_pkgname=zombie

pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="A super fast, modern terminal-based process manager (TUI)"

license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"

depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
		"LICENSE")
sha256sums=('09c01801393358ae2991e42a33a60070fea02c4745ee4554dbdc34fad6deeebf'
            '9c443bf5135ab4eb2c208bfa74825614ecbf5fe257e4f1a2938d7ab0fcf3f6d9')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	CFLAGS+=" -ffat-lto-objects" RUSTFLAGS+=" --remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
