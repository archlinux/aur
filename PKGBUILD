# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=safedep
_pkgname=pmg
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="PMG protects developers from getting hacked by malicious open source packages"

pkgver=0.7.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('c008219181c47f42113320b0c2d423de6a89ab24f2cda32929b81561e61ac01d')
sha256sums_i686=('afb9effbb3ee013089cdb06a228d6f1bd476337c496cd657813ccf990269b9d9')
sha256sums_aarch64=('43211b15915b26445875f7185300fc8e3aba510c758a0b3e1dcc9e8a997060f9')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
	${arch[2]})
		_CARCH="${_barch[2]}"
		;;
esac

build() {
	cd "${srcdir}/" || exit

	./${_pkgname} completion bash > ${_pkgname}.bash
	./${_pkgname} completion zsh > ${_pkgname}.zsh
	./${_pkgname} completion fish > ${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
