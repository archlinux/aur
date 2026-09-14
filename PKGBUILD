# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=tappunk
pkgname=gsty
pkgver=0.1.18
pkgrel=1
pkgdesc="Ghostty terminal theme browser with live preview TUI"

arch=('x86_64')
license=('MIT')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc' 'ghostty')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4133c7f51b69838beba72bffea5f99e8e10e5142b3b38f017c7d75d46794ccee')

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
