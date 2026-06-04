# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jabbalaci
_gitname=qjump
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Bookmark directories on your local machine and switch between them easily"

pkgver=0.3.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
makedepends=('make' 'nim')
depends=('glibc' 'libgcc')

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('3b16145c2fd1e164a35e6ce2da5807248073006981c4d2f6fdd8a53389d8f592')


prepare() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	sed -i -e 's|"{DB_DIR}/qjump.txt"|"{DB_DIR}/\.qjump.txt"|g' qjump.nim

	sed -i -e "s|QJ=\".*\"|QJ=\"/usr/bin/${_appname}\"|g" function.zsh
	sed -i -e "s|QJ=\".*\"|QJ=\"/usr/bin/${_appname}\"|g" function.bash
	sed -i -e "s|set -l QJ \".*\"|set -l QJ \"/usr/bin/${_appname}\"|g" function.fish
}

build() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	make rel
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "function.zsh" "${pkgdir}/usr/share/${_appname}/${_appname}.zsh"
	install -Dm644 "function.bash" "${pkgdir}/usr/share/${_appname}/${_appname}.bash"
	install -Dm644 "function.fish" "${pkgdir}/usr/share/${_appname}/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
