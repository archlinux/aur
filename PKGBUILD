# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=sqly
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Eaisly execute SQL against CSV/TSV/LTSV/JSON and Microsoft Excel™ with shell"
arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('cosign')

options=('!strip')

_pkgsrc="${_pkgname}-${pkgver}"

source=("${_pkgsrc}-checksums.txt::${url}/releases/download/${_pkgvername}/checksums.txt"
		"${_pkgsrc}-checksums.txt.sigstore.json::${url}/releases/download/${_pkgvername}/checksums.txt.sigstore.json")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
sha256sums=('55d39cd9606954531ebeb82b217d8208cab5c60960de044c3a0d21d142303785'
            '296c477243e0f220fdd9cf522dd88c223133b7392a3d5de88e4962deb9bdbaf8')
sha256sums_x86_64=('5ea7c24976fbb0f17fa7372690de427164ca1e985425e6655ab6185d1664e5e8')
sha256sums_aarch64=('7dfe6069ff61ce9f5f8583227f150ea4086c5e036b0fd1dfb5081342786f9454')


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

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
