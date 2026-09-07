# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_appname=hson
pkgauthor=kantord
pkgname=headson
_cratename=${pkgname}
pkgver=0.17.1
_version=${pkgver}
pkgrel=1
pkgdesc="Budget‑constrained JSON preview renderer"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc' 'libgcc' 'zlib' 'jq')
makedepends=('cargo')

provides=("${_appname}")

source=("${_cratename}-${_version}.crate::https://crates.io/api/v1/crates/${_cratename}/${_version}/download")
sha256sums=('c2bbb26f40c8b3880f83b0ff9dd79c114d1eacf7e47d1d0ecbbc0a8c94f52346')

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
