# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor Amolith <amolith@secluded.site>

_pkgauthor=bmf-san
_pkgname=ggc
pkgname=${_pkgname}-bin
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"

pkgver=8.7.2
pkgrel=1
_ghversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_ghversion}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_ghversion}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_ghversion}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('d23c81fe7e7f9e7a941cc4988671ac16f95e400b02d186e29c7880caa46d1fb2')
sha256sums_aarch64=('03a392a766c4959b11e68a3fc033bb548514a4e490cd884633b8c4778ecb5e69')


build() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions/"
	./${_pkgname} completion bash > ./completions/${_pkgname}.bash
	./${_pkgname} completion zsh > ./completions/${_pkgname}.zsh
	./${_pkgname} completion fish > ./completions/${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "./completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "./completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "./completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
