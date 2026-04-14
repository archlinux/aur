# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=bare
_appname=${_gitname}
pkgname=${_appname}-shell
pkgdesc="Interactive shell in x86_64 Linux assembly"

pkgver=0.2.8
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
sha256sums=('69bdc9e0ec79a892132281dcdc06de896aa96c7bf4c352c5185e8dcda21e2747')


build() {
	cd "${srcdir}/${_appname}/" || exit 1

	make
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
