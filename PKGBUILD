# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=hson
pkgauthor=kantord
pkgname=headson
pkgver=0.17.0
_version=${pkgname}-v${pkgver}
pkgrel=1
pkgdesc="head/tail for structured data - summarize/preview JSON/YAML and source code"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc' 'libgcc' 'zlib')
makedepends=('cargo')

provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_version}.tar.gz")
sha256sums=('9555186f0f79a8be725aec6a3d857ae6d2b58133e060b0b7eeeeb85715284dbf')

prepare() {
	cd "${pkgname}-${_version}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${_version}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "${pkgname}-${_version}"

	./target/release/${_appname} --help
}

package() {
	cd "${pkgname}-${_version}"

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
