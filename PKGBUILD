# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sorairolake
_pkgname=abcrypt-cli
_appname=${_pkgname%-cli}
pkgname=${_pkgname}-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple, modern and secure file encryption tool"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname//-cli/}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname//-cli/}/${_pkgname}-v${pkgver}"
license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.zst::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname//-cli/}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.zst")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.zst::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname//-cli/}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.zst")
sha256sums_x86_64=('effc8a68b4632055fe6d3f26e9a0010e687e6a4a824706cdff64d4e729ad2954')
sha256sums_aarch64=('6cb8253655b6b39d018013e745d6b2681d9e50e4d2035cda867e8f558136b5fa')


build() {
	cd "${srcdir}/${_pkgname//-cli/}-v${pkgver}-${CARCH}-unknown-linux-musl" || exit

	mkdir -p completions
	./"${_appname}" completion zsh > "completions/${_appname}.zsh"
	./"${_appname}" completion bash > "completions/${_appname}.bash"
	./"${_appname}" completion fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_pkgname//-cli/}-v${pkgver}-${CARCH}-unknown-linux-musl" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	for manpage in "./man/"*.1 ; do
		install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man1/$(basename ${manpage})"
	done
	for manpage in "./man/"*.5 ; do
		install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man5/$(basename ${manpage})"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for license in "./LICENSES/"* ; do
		install -Dm644 "${license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-$(basename ${license//\.txt/})"
	done
}
