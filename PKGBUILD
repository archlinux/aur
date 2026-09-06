# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=flawme
_gitname=varn
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Local state checkpointing and rollback system for AI agents and automated tools"

pkgver=0.3.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")

depends=('glibc' 'libgcc')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('39538cdd302c1946b90a0926955c33ea13c95289022c69f64333f4f56135c025')


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

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/usage.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "docs/safety.md" "${pkgdir}/usr/share/doc/${pkgname}/SAFETY.md"
	install -Dm644 "docs/architecture.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE--APACHE"
}
