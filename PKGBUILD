# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=hson
pkgauthor=kantord
pkgname=headson
_cratename=${pkgname}
pkgver=0.17.0
_version=${pkgver}
pkgrel=1
pkgdesc="Budget‑constrained JSON preview renderer"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc' 'libgcc' 'zlib')
makedepends=('cargo')

provides=("${_appname}")

source=("${_cratename}-${_version}.crate::https://crates.io/api/v1/crates/${_cratename}/${_version}/download")
sha256sums=('66b4c69555ead9d88886861ce52aa1c15200c72999070d3bdc1b7a2772e0ea39')

prepare() {
	cd "${_cratename}-${_version}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${_cratename}-${_version}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "${_cratename}-${_version}"

	./target/release/${_appname} --help
}

package() {
	cd "${_cratename}-${_version}"

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
