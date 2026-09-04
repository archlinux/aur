# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neurosnap
_pkgname=zmx
pkgname=${_pkgname}-bin
pkgdesc="Session persistence for terminal processes"

pkgver=0.8.0
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
sha256sums=('3ca71e6de1a55a184ac82ccc550f8a0ed5b638d7de7acb45447d317b91208b1b'
            'e14ad5ed5f3e241feb14696bcc4feb3100c94a5fe6e867c114ced0e435466532'
            '56bab989df218f62a6deb746b43903340291dafbc7a811e3fa0c8ea889f8f5ea')
sha256sums_x86_64=('cd928e56fc5d2f1d71b1aa5d0e2ea39c96d4aea77cd047260932874c98eac5cb')
sha256sums_aarch64=('09978ee2ee0813ed1f2979798b33da69b410c6e356888345e04f957f7487fd13')


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
