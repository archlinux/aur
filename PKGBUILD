# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=c0d-0x
_gitname=cruxpass
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A minimal CLI password manager designed to be simple, dependency-light, and transparent"

pkgver=2.0.2
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('make' 'gcc')
depends=('glibc' 'sqlcipher' 'libsodium')

provides=("${_appname}")

options=(!strip)

source=("git+${url}.git#tag=v$pkgver")
sha256sums=('d1a8b8dc301d8643a1873475cced02ca6af478a9310ce031ddded393c0145b7c')


build() {
	cd "${srcdir}/${_appname}/" || exit 1

	make

	mkdir -p completions
	"./bin/${_appname}" completion zsh > "./completions/${_appname}.zsh"
	"./bin/${_appname}" completion bash > "./completions/${_appname}.bash"
	"./bin/${_appname}" completion fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_appname}/" || exit 1

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "./completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "./completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "./completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
