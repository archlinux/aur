# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=riffdiff
_pkgname=riff
pkgver=2.26.0
pkgrel=1
pkgdesc="A diff filter highlighting which line parts have changed"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/walles/riff'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
conflicts=("${_pkgname}")  # binary name conflicts with riff dependency manager
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('89c9670054121186e3d0b492a315c79e94e5adf965b64f6197249f175df33082')

prepare() {
	cd "${_pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

check() {
	cd "${_pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	# test potentially (though not currently) overwrites binary from `build`
	# see: https://gitlab.com/sequoia-pgp/sequoia-sq/-/issues/96
	export CARGO_TARGET_DIR=target-test
	cargo test --release --frozen --all-features
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
