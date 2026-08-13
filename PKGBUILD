# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Division-36
_gitname=Z-Jail
_appname=${_gitname,,}
pkgname=${_appname}
pkgdesc="A lightweight, multi-layer Linux sandbox for secure, auditable code execution"

pkgver=1.1.0
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
sha256sums=('2fa4a4d5bfff2a0a133a7bae97314b6d0c46ae74630bef5d0a5da6c1d5aee636')


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
