# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neurosnap
_pkgname=zmx
pkgname=${_pkgname}-bin
pkgdesc="Session persistence for terminal processes"

pkgver=0.6.0
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
_urlbin="https://zmx.sh/a"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{-bin,-git})

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${_urlbin}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${_urlbin}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('20e2a73f5a5afc48447843706d1747504f395b402770d5dbd2d15fd761b556d5'
            '56bab989df218f62a6deb746b43903340291dafbc7a811e3fa0c8ea889f8f5ea')
sha256sums_x86_64=('7ee4b12150dd0d736d271ba1cb06942244c10b857841a663517297ac65c720dd')
sha256sums_aarch64=('dbbb3df7428bbe645cc26f34dd67b61b07953a8ce3daa6f3e501c49d392724f8')


build() {
	cd "${srcdir}/" || exit

	./${_pkgname} completions bash > ${_pkgname}.bash
	./${_pkgname} completions zsh > ${_pkgname}.zsh
	./${_pkgname} completions fish > ${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
