# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=monji024
_pkgname=peek
_pkgprefix=bash
_cratename=${_pkgprefix}-${_pkgname}
_appname=${_pkgprefix}-${_pkgname}
pkgname=${_cratename}
pkgdesc="Interactive TUI debugger, line profiler, and time-travel inspector for Bash scripts"

pkgver=2.0.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')
license=('MIT')
url="https://github.com/${_pkgauthor}/${_pkgname}"

provides=("${_appname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download"
		"fix_readme.patch")
sha256sums=('ea6d00bfb041eba181b23700dabe73ec1523c77ff172f5edf94ff1d5dd50d869'
            '11b19c79ed526efaf9483a651e8031b51767257c538291276011f07e104887e5')

prepare() {
	cd "${pkgname}-${pkgver}" || exit

	patch README.md ../fix_readme.patch

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

	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
