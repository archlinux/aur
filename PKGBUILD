# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=safedep
_pkgname=vet
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Protect against malicious open source packages"

pkgver=1.17.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('fcea8d81b832fd57d158693c3bedd5dcbd6bc1b6db69f04291b34eef23b972f6')
sha256sums_aarch64=('205b134a24f9f0d783f8910ffd32c3329f6324b929b29596b6f020bd071e6c41')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

build() {
	cd "${srcdir}/" || exit

	./${_pkgname} completion bash > ${_pkgname}.bash 2> /dev/null
	./${_pkgname} completion zsh > ${_pkgname}.zsh 2> /dev/null
	./${_pkgname} completion fish > ${_pkgname}.fish 2> /dev/null
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
