# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Division-36
_gitname=Z-Jail
_appname=${_gitname,,}
pkgname=${_appname}
pkgdesc="A lightweight, multi-layer Linux sandbox for secure, auditable code execution"

pkgver=1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('LicenseRef-AXIOM')

makedepends=('make' 'nasm')
depends=('bash')

provides=("${_appname//-/_}")

options=(!strip)

source=("git+${url}.git#tag=${_gitversion}")
sha256sums=('8abf2e80a8c0876c366fb75754f4998112d43291f7abb83f7817bcc641d4c353')


prepare() {
	cd "${srcdir}/${_gitname}/" || exit 1

	sed -i -e 's|/usr/local|/usr|g' "Makefile"
}

build() {
	cd "${srcdir}/${_gitname}/" || exit 1

	env -u CFLAGS make
}

check() {
	cd "${srcdir}/${_gitname}/" || exit 1

	make check

	env -u CFLAGS make test
}

package() {
	cd "${srcdir}/${_gitname}/" || exit 1

	make DESTDIR="${pkgdir}" install PREFIX="/usr"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
