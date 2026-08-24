# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=amterp
_gitname=rad
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Modern CLI scripts made easy."

pkgver=0.12.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}"{,ls})
conflicts=("${pkgname%-bin}")

makedepends=('git')

options=('!strip')

_gitfolder="git"

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('044b9fa55cb773bd5d6a3a4634efdd9f2f4aef8d66bef72dac2913ad3b551684')
sha256sums_aarch64=('55d271aba82bf536e39ca5cbf1d5b8b507b51db418f796e6bdb4e6e6550b0d72')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 --branch "${_gitversion}" "${_ghurl}" ${_gitfolder} && cd git

	git sparse-checkout set --no-cone /docs && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "${_appname}ls" "${pkgdir}/usr/bin/${_appname}ls"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	cp -rf "${_gitfolder}/docs" "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
