# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=akiselev
_pkgname=debugger-cli
_pkgsuffix=cli
_cratename=${_pkgname}
_appname=${_pkgname%-${_pkgsuffix}}
pkgname=${_cratename}
pkgdesc="LLM-friendly debugger CLI using the Debug Adapter Protocol"

pkgver=0.1.3
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')
license=('GPL-3.0-only')
url="https://github.com/${_pkgauthor}/${_pkgname}"

provides=("${_appname}")

makedepends=('cargo')
depends=('glibc' 'libgcc' 'openssl' 'bzip2' 'xz')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('82a043245b7bca76f23bcb4f37f1ca166daa6840a6d1ae812b3934159dac67f8')

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

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

}
