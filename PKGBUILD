# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neurosnap
_pkgname=zmx
pkgname=${_pkgname}-bin
pkgdesc="Session persistence for terminal processes"

pkgver=0.7.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
_urlbin="https://zmx.sh/a"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}"{,-git})

options=('!strip')

source=("CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${_urlbin}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${_urlbin}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('4ec51593325078c9fda65e36784a116bd0d58e2251cbf3eb6819106b965af556'
            'd7124de50b0966db9b40d3bbef0f37bd831e0294368c5f66af358836ea459399'
            '56bab989df218f62a6deb746b43903340291dafbc7a811e3fa0c8ea889f8f5ea')
sha256sums_x86_64=('ec82d753e12537b79a76bce73399d57698e529f4744eb5a1a9bcfa6fda7c4b25')
sha256sums_aarch64=('899f9dc743ef72dcdeab3072667c33f507247a960e5c4b7482da54fff7fdae09')


build() {
	cd "${srcdir}/" || exit

	./${_pkgname} completions bash > ${_pkgname}.bash
	./${_pkgname} completions zsh > ${_pkgname}.zsh
	./${_pkgname} completions fish > ${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
