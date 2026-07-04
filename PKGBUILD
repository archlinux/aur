# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.7.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Update binaries installed by \"go install\" with goroutines"
arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

_pkgsrc="${_pkgname}-${pkgver}"

source=("README-${pkgver}.md::${_urlraw}/README.md" "LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"${_pkgsrc}-checksums.txt::${url}/releases/download/${_pkgvername}/checksums.txt"
		"${_pkgsrc}-checksums.txt.sigstore.json::${url}/releases/download/${_pkgvername}/checksums.txt.sigstore.json")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_i686=("${_pkgsrc}-${arch[1]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[2]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[2]}.tar.gz")
sha256sums=('10aecf2229dbc911063b467f07efad32c7bd982e528ed95e51d46d14876277b1'
            '9342d2ca1f93313e4f2a06e19db82e4a94462fab17c82eda907226631bd62079'
            '65bd4fb2d1576a07aac0bd40832b5cb6cbf08863ec9ddc2ddce93cc533280777'
            'd752eba6d738e9b81cbc07b5bd8277a5e788617848fc064ad3679736dce3f736')
sha256sums_x86_64=('596bdfbe8dd7280bd4367a3a500e93c5842c3485c97f037612914d8712907f62')
sha256sums_i686=('532ef6eb49781bcbb636b7e5580a954d599368c197fe8e10301314e91210cf74')
sha256sums_aarch64=('20a7ec1e824fcebe88d6bf8bcc1d0f210f2d314f0e778a106bf94f3db6403c7d')


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
		-e "/${_pkgsrc//-/_}_${_barch[2]}.tar.gz/{s//${_pkgsrc}-${arch[2]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "./completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "./completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "./completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
