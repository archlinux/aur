# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=rtss
pkgver=0.6.2
pkgrel=1
pkgdesc="Relative TimeStamps for Stuff"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Freaky/rtss"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e526d77eb3cd1d691dbcec937992c297aab4bc369b121620ee4903cfbd1525e')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm 755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
	install -vDm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -vDm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE.txt'
}
