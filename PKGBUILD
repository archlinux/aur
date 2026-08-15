# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=atago
pkgname=${_pkgname}-bin
pkgver=0.20.0
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
sha256sums=('e195723343250622e7ecfb1687cb95301c1b9ade684a3744a3a15e9ece1b27d2'
            '14dc91bfcfc592ea63a2b1975f43bc530a3aed3fc9ebc22a80cf910b3792df47')
sha256sums_x86_64=('c87f418389e9490274d07eb625536a404da5cf8a7f58836ffda3524f6e91e73e')
sha256sums_aarch64=('a224ca8cc1037f78ece5e1d0c60947ea77b5bc95a213660c7b5e8baba6f27228')


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
