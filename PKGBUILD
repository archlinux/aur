# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.8.0
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
sha256sums=('a30da80cd3d9ebf3944864c5da6d4c13814966ce17fc649a3e346e670aa7abdd'
            '9342d2ca1f93313e4f2a06e19db82e4a94462fab17c82eda907226631bd62079'
            '81fbaf69f2917f6941bdb9c622d5e6e06240e52a5a4c1bcb930cc5246e45108f'
            '3a94e82d6f66e1104e019637f898fca11fc98758281b0937b8bccb8096e67392')
sha256sums_x86_64=('d45843fc6fed99f8268b141b93aaa488b0beac773cffd918392a15334ccfca5e')
sha256sums_i686=('e54cb0bf154b231398c4fe3d3e6e15dce19ac2b03a7d94f4c1847be5beb5fd66')
sha256sums_aarch64=('b38a32e6dcdece3c40f6747ca0ca6036624c259be4f9fd43fb7893ee9d3119c6')


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
