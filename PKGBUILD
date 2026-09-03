# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ruiiiijiiiiang
_gitname=lazynmap
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Build complex nmap commands with an intuitive TUI"

pkgver=0.1.3
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

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('b17b453a952e6900152d58c540fb15d6baa0c6d1bb2f2160cff8d0519afc1e96'
            '7e22db8d3b38510368e9801f5d7b34ce0cf4eb7067fed2e3b946c4039da29ac7')
sha256sums_x86_64=('0604ddb92c2828a2e1dafec59a37f28f2db5e98ddb670d8d620b966ca40d5d9d')


prepare() {
	cd "${srcdir}/" || exit

	patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${_appname}-${CARCH}-${pkgver}"
	patchelf --shrink-rpath "${_appname}-${CARCH}-${pkgver}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
