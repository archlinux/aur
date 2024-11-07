# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=tfkhdyt
_pkgname=urban-cli
pkgname=${_pkgname}-bin
pkgver=0.2.3
pkgrel=2
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL3')
arch=('x86_64' 'aarch64')
makedepends=('help2man' 'gzip')
conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}" "${_pkgname%-cli}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")

source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")

sha256sums=('4002f795f7119311fc2413ef76e823dc38b3a59864c472c323c65089e1fd7861'
            '39727bad4822b09abc3fba668fc4f89c11d3a4be83d0abf16c3547601c785f0c')
sha256sums_x86_64=('972b4af6c127e479c1fde0c0e07dd567ee9504e809c483f1230110082e0166b8')
sha256sums_aarch64=('568aed25a5a21aad8012411ae6b607fcdbd07274d91c65ddfabeaeed9176949d')


build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -srf "${pkgdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname%-cli}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
	ln -srf "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname%-cli}.1.gz"
}
