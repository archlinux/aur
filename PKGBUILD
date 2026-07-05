# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ABDsheikho
_gitname=histclean
_appname=${_gitname}
pkgname=${_appname}-git
pkgdesc="A cli tool to clean command shell history files"

pkgver=0.4.0r1.gb3e98ad
pkgrel=1

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}"{,-bin})

makedepends=('zig')

options=(!strip)

source=("git+${_ghurl}")
sha256sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_appname}/" || exit

	git describe --long --tags --abbrev=7 | sed 's/v\([^-]*-\)\([^-]*-\)/\1r\2/;s/-/./g'
}

build() {
	cd "${srcdir}/${_appname}/" || exit

	zig build -Doptimize=ReleaseSafe --prefix "outputs" --cache-dir "zig-cache" --global-cache-dir "zig-global-cache"
}

check() {
	cd "${srcdir}/${_appname}/" || exit

	zig build test
}

package() {
	cd "${srcdir}/${_appname}/" || exit

	install -Dm755 "outputs/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm644 "doc/man/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
