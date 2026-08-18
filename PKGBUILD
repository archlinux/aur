# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=superradcompany
_gitname=microsandbox
_appname=${_gitname}
_appalias=msb
pkgname=${_appname}-bin
pkgdesc="Easy, fast and local-first microVM runtime"

pkgver=0.6.10
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
sha256sums=('546141fb4a0cf7c52167ed65571d1cf8be3a98421c44ab47beb1f32c18b8bcd1'
            'a276ca3381fefb9cde42fccae847856085c76027557d62eee83f057eb6c53433')
sha256sums_x86_64=('65bb223972f00b3ce64182161eabd96ad1a84f4d4af5eec9272eb00d2b437f41')
sha256sums_aarch64=('fc62cba9b7ae54ae8feb1d98ebce83f5f38311c982eee467846b915384e3e077')


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
