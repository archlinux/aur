# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=PaulBunch
_gitname=rmd
_appname=${_gitname}
pkgsuffix=cli
pkgname=${_appname}-${pkgsuffix}-bin
pkgdesc="One-shot Linux reminders that survive reboot and show up as desktop notifications"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"TIME-${pkgver}.md::${_ghurlraw}/docs/TIME.md"
		"VISION-${pkgver}.md::${_ghurlraw}/docs/VISION.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('8c4e845fc61eb8f8e77f66c9ac0d54d9e572418c2e82c9cf16f6a342c40c254b'
            'f60486c431db4b8eac6fb01dfbf3243c413d5b1ef93400b68512f0af76af4366'
            '75b9900c35b2ded25f243290e1ebea9bb144005a30c49d3ea1fd63d432982d58')
sha256sums_x86_64=('5dc957de4890f18b4645419de6a8e511d7c82b16f714452d51d6cda99dac8ab6')
sha256sums_aarch64=('f120ff98be6dcb18cac1d5e22633dd6c91440a80b75044b3cad79c297ae6c1c1')


prepare() {
	cd "${srcdir}/" || exit

	sed -e 's|%h/.local/bin/|/usr/bin/|g' -i "${_appname}.service"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "VISION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/VISION.md"
	install -Dm644 "TIME-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TIME.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
