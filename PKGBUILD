# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=atago
pkgname=${_pkgname}-bin
pkgver=0.14.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="End-to-end test runner for CLI tools"
arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

_pkgsrc="${_pkgname}-${pkgver}"

source=("${_pkgsrc}-checksums.txt::${url}/releases/download/${_pkgvername}/checksums.txt"
		"${_pkgsrc}-checksums.txt.sigstore.json::${url}/releases/download/${_pkgvername}/checksums.txt.sigstore.json")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
sha256sums=('9bdd4707de4b69874a588ee3f88334d0acd2084e07eecc259ac554ae3867feb9'
            '5ea356c5f21655650bf2bbc86a71dee4bdb935769511da73b2f0433d539e87e8')
sha256sums_x86_64=('bf39d7e9b1913996c953ef3db855cf0170e2db34a62f621b29047bd3130fcc78')
sha256sums_aarch64=('e5798e32f137ba545b109038ebd38515b581a74c0309e8997fb0895a732eda5b')


verify() {
	cosign verify-blob \
		--bundle "${_pkgsrc}-checksums.txt.sigstore.json" \
		--certificate-identity-regexp "${url}/\.github/workflows/release\.yml@refs/tags/${_pkgvername}" \
		--certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
		"${_pkgsrc}-checksums.txt"

	cp "${_pkgsrc}-checksums.txt" "checksums.txt"
	sed -n \
		-e "/${_pkgsrc//-/_}_${_barch[0]}.tar.gz/{s//${_pkgsrc}-${arch[0]}.tgz/g;p;}" \
		-e "/${_pkgsrc//-/_}_${_barch[1]}.tar.gz/{s//${_pkgsrc}-${arch[1]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
}

build() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	"./${_pkgname}" completion zsh > "./completions/${_pkgname}.zsh"
	"./${_pkgname}" completion bash > "./completions/${_pkgname}.bash"
	"./${_pkgname}" completion fish > "./completions/${_pkgname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "./completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "./completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "./completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
