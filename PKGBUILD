# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aureliojargas
_gitname=txt2regex
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Regex wizard for the terminal, written in Bash"
pkgver=0.10b
pkgrel=1

_gitcommit=0f4199127225f021ef3825f3c43ab450748f32dc

arch=('any')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
url=${_ghurl}

license=('GPL-2.0')

makedepends=('make' 'gettext' 'shfmt' 'shellcheck')
depends=('bash')

provides=("${_appname}")

options=(!strip)

source=("git+${_ghurl}#commit=${_gitcommit}")
sha256sums=('58d86ad1a06e56da604866b3d82aac6bf369c220e5113c73a6dd8b31938e2912')


prepare() {
	cd "${srcdir}/${_appname}/" || exit 1

	sed -i -e '/# shellcheck/s/$/,SC2004,SC2086,SC2223,SC2321/' "${_appname}.sh"
}

build() {
	cd "${srcdir}/${_appname}/" || exit 1

	make DESTDIR="${pkgdir}" doc
}

check() {
	cd "${srcdir}/${_appname}/" || exit 1

	make DESTDIR="${pkgdir}" check
}

package() {
	cd "${srcdir}/${_appname}/" || exit 1

	make DESTDIR="${pkgdir}" install

	install -Dm644 "man/${_appname}.man" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
