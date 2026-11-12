# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.3.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('make' 'go')
provides=("${_appname}")

depends=('keepassxc')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('d79a88addb3229856295ccfd24e2922cc5fddb4c419f703044194c9f27f450d3')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	env -u LDFLAGS make build VERSION="${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	env -u LDFLAGS make install DESTDIR="${pkgdir}" PREFIX="/usr" VERSION="${pkgver}"

	install -Dm644 "CLI.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
	install -Dm644 "TUI.md" "${pkgdir}/usr/share/doc/${pkgname}/TUI.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
