# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=tappunk
pkgname=gsty
pkgver=0.1.9
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
sha256sums=('2699954023afee3f73a7a812c4afa93c9d6681df11d2cbdf84e3b32dac6e962c')

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
