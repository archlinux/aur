# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=km-clay
_gitname=whoa
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal screensaver with some cool animations"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('patchelf')
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}.${_gitversion}")
sha256sums=('a6f4ed8dda8d30d4487e672387b960fdc569e69b2b7c3433635c09fc48bcf96e'
            'ccfe6c523914307ac9282e9554940bb5e04c7429802b2383652370caf14e8253')
sha256sums_x86_64=('214b2ed14dbf9dfa06d9d73c0e9c7cbe27faded449dbb45dfd27a6138cdb90f0')

prepare() {
	cd "${srcdir}/" || exit

	patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${_appname}-${CARCH}-${pkgver}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
