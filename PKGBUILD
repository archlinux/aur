# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Zouuup
_pkgname=landrun
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Run any Linux process in a secure, unprivileged sandbox using Landlock LSM"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('f613c30920743111429f7c1cb801f49ccaafe8ae3319b3b0a5f8aca94e5fc082'
            '5960a69b6bfd2f4f6499eb95d8b5c41a826443dd26963e79b769d5b779705787')
sha256sums_x86_64=('2738aa171a83246d98a24ef8afa756512b1f013b6ca7dcc95313276f8d41a8d6')


prepare() {
	cd "${srcdir}/" || exit

	chmod +x "./${_pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}-${pkgver}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
