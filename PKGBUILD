# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ivankovic
_gitname=omnidiff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast, robust, accurate diffing"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('bc76958607248063c153009f1a819e1b2bb2d900f8bb91775f9d04e22185da06')
sha256sums_aarch64=('a19d66f7d442146c03080c9e140815a5ab6d2bb68b2d46d9d34ba2d60f4c7f68')


build() {
	cd "${srcdir}/" || exit

    mkdir -p completions
    ./"${_appname}" util completions zsh > "completions/${_appname}.zsh"
    ./"${_appname}" util completions bash > "completions/${_appname}.bash"
    ./"${_appname}" util completions fish > "completions/${_appname}.fish"

    mkdir -p manpage
    ./"${_appname}" util man > "manpage/${_appname}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "manpage/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "THIRD-PARTY-NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}THIRD-PARTY-NOTICES"
}
