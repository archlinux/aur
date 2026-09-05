# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neurosnap
_pkgname=zmx
pkgname=${_pkgname}-bin
pkgdesc="Session persistence for terminal processes"

pkgver=0.8.1
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
sha256sums=('30a7e44561e61c408038fe4d6e8463598c49393798860243711e06a19445c54c'
            'd17027dba68b8601543f99495d7e1d0851d976ddc907fc872accfcfe74fd098a'
            '56bab989df218f62a6deb746b43903340291dafbc7a811e3fa0c8ea889f8f5ea')
sha256sums_x86_64=('dfd75720b942466f28870731cc86dbc07afa72fb8f3bd5eeb4ff707e4eecebe8')
sha256sums_aarch64=('943eb44c812333fd450da12097521afd3339436e86f8c2ac618b905c4c9ece68')


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
