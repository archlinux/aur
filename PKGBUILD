# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.8.1
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
sha256sums=('486b8ccca93e8ddc403d072b470decf7f4431b7218bcf7d53ad86c725dd58af0'
            '9342d2ca1f93313e4f2a06e19db82e4a94462fab17c82eda907226631bd62079'
            '9445fab309a1747097cacca69c63bc4b3967e8e39b9cd480c5f246544314953d'
            'ba21b4d509d3c5872bec589600156f25698a47ee441862276220e7bbab2b5fd0')
sha256sums_x86_64=('7ee0dbb3c043f7e2d1afd0b44bad2f4fdae647e7245246b9e0ff75524c48b76d')
sha256sums_i686=('ea3f13e11b471bd15bbdd8e80e6d4d381fde58a03dde9894c92c0975baa8f597')
sha256sums_aarch64=('562cbf136502ba5b93eb474a1f42d6e1e29b93abc5bd864c2c392e129538591e')


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
