# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: qubidt <qubidt at gmail dot com>

pkgname=riffdiff
_pkgname=riff
pkgver=3.5.1
pkgrel=1
pkgdesc="A diff filter highlighting which line parts have changed"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/walles/riff'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}") # binary name conflicts with riff dependency manager
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0f7a023e3fc0fad8822aa94e52d0c70ece5f0bf1ed4b4fa56d5f12d739bd82d4')

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
