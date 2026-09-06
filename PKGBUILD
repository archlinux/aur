# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=RudySource
_gitname=Dirgo
_appname=dgo
pkgname=${_gitname,,}
pkgdesc="Fast, local-first directory navigation"

pkgver=0.8.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

makedepends=('cargo')
provides=("${_appname}")
depends=('glibc' 'libgcc')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3c6ad731c04f5eaec4f8001142e2bf69dcf31d11dcb07d0350a82a9d4216b531')


prepare() {
	cd "${_gitname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_gitname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release

	mkdir -p "./completions"

	"./target/release/${_appname}" completions zsh > "./completions/${_appname}.zsh"
	"./target/release/${_appname}" completions bash > "./completions/${_appname}.bash"
	"./target/release/${_appname}" completions fish > "./completions/${_appname}.fish"
}

check() {
	cd "${_gitname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${_gitname}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
