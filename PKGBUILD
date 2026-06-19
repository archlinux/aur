# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arnauda-gh
_gitname=Alwide
_appname=${_gitname,,}
_execname=al
pkgname=${_appname}
pkgdesc="The Modern TUI IDE. The intuitive experience in your terminal."

pkgver=1.0.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")

makedepends=('git' 'make' 'pkgconf' 'clang' 'rust' 'cargo' 'ncurses' 'tree-sitter-cli')
depends=('glibc' 'ncurses')

install="${_appname}.install"

options=(!strip)

source=("git+${_ghurl}.git#tag=${_gitversion}")
sha256sums=('bcacc4b93059777d15e969195da9f961f6c9dc8bb3b1effef4c84a2c8bde9cf3')


prepare() {
	cd "${srcdir}/${_gitname}" || exit

	git submodule update --init --recursive --depth 1
}

build() {
	cd "${srcdir}/${_gitname}" || exit

	make PREFIX="/usr" release
}

package() {
	cd "${srcdir}/${_gitname}" || exit

	make DESTDIR=${pkgdir} PREFIX="/usr" install

	mv "${pkgdir}/usr/bin/${_execname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
