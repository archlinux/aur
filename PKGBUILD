# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=TSODev
_pkgname=terapi
_cratename=${_pkgname}
_appname=${_pkgname}
pkgname=${_pkgname}
pkgdesc="Terminal + API — a keyboard-driven TUI for exploring, testing, and automating REST and GraphQL APIs, without leaving your terminal"

pkgver=0.10.15
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'openssl')

provides=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('1fb4f21042a34ee1ca1be29f33de1f8fb29e940960ffe163ae3c171dbb90d35c')

prepare() {
	cd "${_cratename}-${_pkgvername}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_cratename}-${_pkgvername}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "${_cratename}-${_pkgvername}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rf "examples" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
