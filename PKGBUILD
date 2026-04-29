# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=duane1024
_pkgname=l123
_appname=${_pkgname}
pkgname=${_pkgname}
pkgdesc="A Lotus 1-2-3–style terminal spreadsheet with modern Excel compatibility"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'pkgconf')
depends=('glibc' 'libgcc' 'bzip2' 'fontconfig' 'freetype2')

provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_pkgvername}.tar.gz")
sha256sums=('a13bf57c992f95cf174b53f700b2b7643f3ccbf1863a48c20489dfece1d127b6')


prepare() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	./target/release/${_appname} --help
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "docs/XLSX_IMPORT_PLAN.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/CONFIG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/MENU.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/PLAN.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/SPEC.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
