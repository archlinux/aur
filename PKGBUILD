# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=superradcompany
_gitname=microsandbox
_appname=${_gitname}
_appalias=msb
pkgname=${_appname}-bin
pkgdesc="Easy, fast and local-first microVM runtime"

pkgver=0.6.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}" "${_appalias}")
conflicts=("${_appname}")

makedepends=('sed')
depends=('glibc' 'libgcc' 'libcap-ng' 'libkrunfw')

options=(!strip)

_old_libkrunfw_version="5.2.1"
_new_libkrunfw_version="5.5.0"

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appalias}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appalias}-${_barch[1]}")
sha256sums=('ac54e389df7531d933354501f8b80981d154127cbdae4c78e773050086436d75'
            'a276ca3381fefb9cde42fccae847856085c76027557d62eee83f057eb6c53433')
sha256sums_x86_64=('de2b62dca61f793c204ed1cd671800abad6b57d00a492d11338e6e785a0e12fd')
sha256sums_aarch64=('483d06599f5cf229f5c0658ada95b5c46139b8e8a468675d60d2a8da89a869f3')


prepare() {
	cd "${srcdir}/" || exit

	sed -i "s/${_appname}${_old_libkrunfw_version}/${_appname}${_new_libkrunfw_version}/g" "${_appname}-${CARCH}-${pkgver}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appalias}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
