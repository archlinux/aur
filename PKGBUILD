# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=riffdiff
_pkgname=riff
pkgver=3.2.0
pkgrel=1
pkgdesc="A diff filter highlighting which line parts have changed"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/walles/riff'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
conflicts=("${_pkgname}") # binary name conflicts with riff dependency manager
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e3950b5786fc2953d89dccdec29f1092eeab2f0758bdd582229aab4cf5cb4144')

prepare() {
	cd "${_pkgname}-${pkgver}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}-${pkgver}"
	cargo build --release --frozen --all-features
}

check() {
	cd "${_pkgname}-${pkgver}"
	cargo test --release --frozen --all-features
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
