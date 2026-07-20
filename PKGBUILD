# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor Amolith <amolith@secluded.site>

_pkgauthor=bmf-san
_pkgname=ggc
pkgname=${_pkgname}-bin
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"

pkgver=8.7.1
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
sha256sums_x86_64=('72437e9e8a672738ff1abee3de691b0c7af1f229123c72e2a6a77d874f95d0fc')
sha256sums_aarch64=('525939e692dc1ae3a0396a6818fb3e799058a57ff981cf69fa3826c9a055aa34')


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
