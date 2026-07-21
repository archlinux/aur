# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=bare
_appname=${_gitname}
pkgname=${_appname}-shell
pkgdesc="Interactive shell in x86_64 Linux assembly"

pkgver=0.2.42
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlicense')

makedepends=('make' 'nasm')
depends=('bash')

provides=("${_appname}")

install="${_appname}.install"

options=(!strip)

source=("git+${url}.git#tag=v$pkgver")
sha256sums=('6ae00f17295292d3599ab689fc82829fa0024d81155c7ce57b36866b7a7aec4f')


build() {
	cd "${srcdir}/${_appname}/" || exit 1

	make bare
}

check() {
	cd "${srcdir}/${_appname}/" || exit 1

	make bench
}

package() {
	cd "${srcdir}/${_appname}/" || exit 1

	make DESTDIR="${pkgdir}" install PREFIX="/usr"

	# Plugins
	install -Dm755 "plugins/ask" "${pkgdir}/usr/share/bare/plugins/ask"
	install -Dm755 "plugins/suggest" "${pkgdir}/usr/share/bare/plugins/suggest"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
