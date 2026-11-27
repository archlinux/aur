# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=superradcompany
_gitname=microsandbox
_appname=${_gitname}
_execname=msb
pkgname=${_appname}-bin
pkgdesc="Easy, fast and local-first microVM runtime"

pkgver=0.8.3
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_execname}")
conflicts=("${_appname}")

makedepends=('sed')
depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('629852687764985e6541b186c372dcb2258c24c24238ee9d5b0da7c930997afc'
            'a276ca3381fefb9cde42fccae847856085c76027557d62eee83f057eb6c53433')
sha256sums_x86_64=('aae2bec648890ee8a278fe060981c2b2dad313302529860b0d924ec487add12d')
sha256sums_aarch64=('6331b29e613b381b618d7969e24bd3fcc3d137ebaf2f95b029d38b97ef3027b9')


build() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	"./${_execname}" completion zsh > "./completions/${_execname}.zsh"
	"./${_execname}" completion bash > "./completions/${_execname}.bash"
	"./${_execname}" completion fish > "./completions/${_execname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -dm755 "${pkgdir}"/usr/{bin,lib}

	install -Dm755 -t "${pkgdir}/usr/lib/${_appname}/" ${_execname} libkrunfw.so.*
	ln -sf "../lib/${_appname}/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "completions/${_execname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_execname}"
	install -Dm644 "completions/${_execname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_execname}"
	install -Dm644 "completions/${_execname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_execname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
