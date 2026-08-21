# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sorairolake
_pkgname=favico
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="A command-line utility for creating favicons"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.zst")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.zst")
sha256sums_x86_64=('fe767d86b93fe705935aee22470feb3afdd265606110f7f249d5f57507d724c3')
sha256sums_aarch64=('4ef2178c50c9f01ac82a9a6fbcb557784c7bed64babd307e2d3db0d0c954fb8f')


build() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl" || exit

	mkdir -p completions
	./"${_appname}" --generate-completion zsh > "completions/${_appname}.zsh"
	./"${_appname}" --generate-completion bash > "completions/${_appname}.bash"
	./"${_appname}" --generate-completion fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	for manpage in "./man/"*.1 ; do
		install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man1/$(basename ${manpage})"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for license in "./LICENSES/"* ; do
		install -Dm644 "${license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-$(basename ${license//\.txt/})"
	done
}
